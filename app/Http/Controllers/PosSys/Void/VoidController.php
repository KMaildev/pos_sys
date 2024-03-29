<?php

namespace App\Http\Controllers\PosSys\Void;

use App\Helpers\Helper;
use App\Helpers\PrintHelper;
use App\Http\Controllers\Controller;
use App\Mail\VoidMail;
use App\Models\MenuList;
use App\Models\NoticeBoard;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use App\Models\VoidItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class VoidController extends Controller
{
    public function VoidOrder($id)
    {
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table')
            ->findOrFail($id);
        $void_item = new OrderItem();
        $void_reasons = NoticeBoard::all();

        return Inertia::render('Ordered/VoidOrder', [
            'order_infos' => $order_infos,
            'void_item' => $void_item,
            'void_reasons' => $void_reasons,
        ]);
    }

    public function VoidItem(Request $request)
    {
        $item_id = $request->order_item_id;
        $void_item = OrderItem::findOrFail($item_id);
        return response()->json(['void_item' => $void_item]);
    }

    public function  ConfirmVoidItem(Request $request)
    {
        $item_id = $request->item_id;
        $reason = $request->reason;
        $void_qty = $request->void_qty;

        $order_item = OrderItem::findOrFail($item_id);
        $order_info_id = $order_item->order_info_id;
        $order_info = OrderInfo::findOrFail($order_info_id);

        $void_item = new VoidItem();
        $void_item->order_item_id = $order_item->id;
        $void_item->order_info_id = $order_item->order_info_id;
        $void_item->menu_list_id = $order_item->menu_list_id;
        $void_item->price = $order_item->price;
        $void_item->remark = $order_item->remark;
        $void_item->waiter_user_id = $order_item->waiter_user_id;
        $void_item->preparation_status = $order_item->preparation_status;
        $void_item->preparation_date = $order_item->preparation_date;
        $void_item->preparation_user_id = $order_item->preparation_user_id;
        $void_item->difference_time = $order_item->difference_time;
        $void_item->manager_remark = $order_item->manager_remark;
        $void_item->menu_name = $order_item->menu_name;
        $void_item->split_qty = $order_item->split_qty;

        $void_item->qty = $void_qty;
        $void_item->reason = $reason;
        $void_item->void_by = auth()->user()->id ?? 0;
        $void_item->void_date = date('Y-m-d');
        $void_item->void_time = date('h:i:s A');
        $void_item->table_list_id = $order_info->table_list_id;
        $void_item->manager_status = 'nothing';
        $void_item->save();
        $id = $void_item->id;

        // OrderItem::findOrFail($item_id)
        //     ->delete();
        Helper::updateOrderInfoTotalAmount($order_item->order_info_id);
        $this->sendEmail($id);
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    
    public function sendEmail($id){

        $void_item = VoidItem::with('menu_list_table', 'table_list_table', 'void_by_table')
            ->findOrFail($id);

        $data = [
            'id' => $void_item->id,
            'table_name' => $void_item->table_list_table->table_name,
            'menu_name' => $void_item->menu_list_table->menu_name,
            'qty' => $void_item->qty,
            'price' => $void_item->price,
            'void_date' => $void_item->void_date,
            'void_time' => $void_item->void_time,
            'reason' => $void_item->reason,
            'void_by_table' => $void_item->void_by_table->name,
            'manager_status' => $void_item->manager_status,
        ];

        // Mail::to('kkay0261@gmail.com')->send(new VoidMail($data));
    }






    public function getManagerVoidItems(Request $request)
    {
        $void_items = VoidItem::with('menu_list_table', 'table_list_table', 'void_by_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $void_items =  VoidItem::with('menu_list_table', 'table_list_table', 'void_by_table')
                ->where('void_date', '>=', request('start_date'))
                ->where('void_date', '<=', request('end_date'))
                ->get();
        }

        return Inertia::render('Void/ManagerVoidItems', [
            'void_items' => $void_items,
        ]);
    }

    public function managerVoidItemsAccept(Request $request)
    {
        $id = $request->id;
        $void_item = VoidItem::findOrFail($id);
        $void_item->manager_status = 'done';
        $void_item->update();
        $void_item_id = $void_item->order_item_id;
        $void_qty = $void_item->qty;

        $order_item = OrderItem::findOrFail($void_item_id);
        $org_qty = $order_item->qty;
        $total_void = $org_qty - $void_qty;
        if ($total_void == 0) {
            OrderItem::findOrFail($void_item_id)->delete();
        } else {
            $order_item->qty = $total_void;
            $order_item->update();
        }
       
        Helper::updateOrderInfoTotalAmount($void_item->order_info_id);
        $order_info = OrderInfo::findOrFail($void_item->order_info_id);
        $total_amount = $order_info->total_amount;
        if ($total_amount == 0) {
            $order_info->void_status = 'fully_void';
            $order_info->check_out_status = 'paid';
            $order_info->update();
        }

        $menu_list = MenuList::findOrFail($void_item->menu_list_id);
        $printer_name = $menu_list->printer_name;
        $item_name = $void_item->menu_name;
        $item_qty = $void_item->qty;
        $void_manager_status = 'accept';
        $table_no = $order_info->table_lists_table->table_name;
        PrintHelper::voidPrinter($printer_name, $item_name, $item_qty, $void_manager_status, $table_no);
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }



    public function managerVoidItemsReject(Request $request)
    {
        $id = $request->id;
        $void_item = VoidItem::findOrFail($id);
        $void_item->manager_status = 'reject';
        $void_item->update();

        $order_info = OrderInfo::findOrFail($void_item->order_info_id);
        $menu_list = MenuList::findOrFail($void_item->menu_list_id);
        $printer_name = $menu_list->printer_name;
        $item_name = $void_item->menu_name;
        $item_qty = $void_item->qty;
        $void_manager_status = 'reject';
        $table_no = $order_info->table_lists_table->table_name;
        PrintHelper::voidPrinter($printer_name, $item_name, $item_qty, $void_manager_status, $table_no);

        return redirect()->back()->with('success', 'Your processing has been completed.');
    }



    public function voidItemCount(){
        $void_item_total = VoidItem::whereBetween('created_at', [now()->subMinutes(3), now()])
            ->where('manager_status', 'nothing')
            ->count();
        
        return response()->json([
            'void_item_total' => $void_item_total
        ]);
    }
}
