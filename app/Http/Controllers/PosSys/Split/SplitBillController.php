<?php

namespace App\Http\Controllers\PosSys\Split;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class SplitBillController extends Controller
{
    public function SplitBill($id)
    {
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table')
            ->findOrFail($id);

        return Inertia::render('Ordered/SplitBill', [
            'order_infos' => $order_infos,
        ]);
    }

    public function SplitQtyUpdate(Request $request)
    {
        $id = $request->order_items;
        $split_qty = $request->split_qty;

        $menu = OrderItem::findOrFail($id);
        $menu->split_qty = $split_qty;
        $menu->update();
    }

    public function SplitOrderConfirm(Request $request)
    {
        $order_info_id = $request->order_info_id;
        $guest_no = $request->guest_no;

        $countOrderInfo = OrderInfo::count();
        $order_no = sprintf('%06d', $countOrderInfo + 1);
        $inv_count_no = sprintf('%04d', $countOrderInfo + 1);
        $date = date('dmY');
        $inv_no = sprintf('INV-' . $date . '-' . $inv_count_no);


        $order_info_data = OrderInfo::findOrFail($order_info_id);
        $current_guest_no = $order_info_data->guest_no ?? 0;
        $new_guest_no = $guest_no;
        $update_guest_no = $current_guest_no - $new_guest_no;
        $order_info_data->guest_no = $update_guest_no;
        $order_info_data->update();

        $order_info = new OrderInfo();
        $order_info->customer_id = $order_info_data->customer_id ?? 0;
        $order_info->table_list_id = $order_info_data->table_list_id;
        $order_info->guest_no = $guest_no ?? 0;
        $order_info->order_date_time = $order_info_data->order_date_time ?? date('Y-m-d h:i:s A');
        $order_info->order_date = $order_info_data->order_date ?? date('Y-m-d');
        $order_info->order_time = $order_info_data->order_time ?? date('h:i:s A');
        $order_info->order_minutes = $order_info_data->order_minutes ?? date('h:i A');
        $order_info->total_amount = 0;
        $order_info->cashier_user_id = auth()->user()->id ?? 0;
        $order_info->waiter_user_id = auth()->user()->id ?? 0;
        $order_info->order_user_name = auth()->user()->name ?? 0;
        $order_info->order_no = $order_no;
        $order_info->inv_no = $inv_no;
        $order_info->save();
        $order_info_latest_id = $order_info->id;

        $order_items = OrderItem::where('order_info_id', $order_info_id)
            ->where('split_qty', '!=', 0)
            ->get();
        foreach ($order_items as $key => $value) {
            $id = $value->id;
            // New 
            $new_order_item = new OrderItem();
            $new_order_item->price = $value['price'];
            $new_order_item->remark = $value['remark'];
            $new_order_item->menu_list_id = $value['menu_list_id'];
            $new_order_item->menu_name = $value['menu_name'];
            $new_order_item->order_info_id = $order_info_latest_id;
            $new_order_item->qty = $value['split_qty'];
            $new_order_item->split_qty = 0;
            $new_order_item->waiter_user_id = auth()->user()->id ?? 0;
            $new_order_item->save();
            Helper::updateOrderInfoTotalAmount($order_info_latest_id);

            // Update 
            $order_item = OrderItem::findOrFail($id);
            $qty = $value['qty'] - $value['split_qty'];
            if ($qty == 0) {
                OrderItem::findOrFail($order_item->id)->delete();
            } else {
                $order_item->qty = $qty;
                $order_item->split_qty = 0;
                $order_item->update();
            }
        }
        Helper::updateOrderInfoTotalAmount($order_info_id);
        return Redirect::route('pos_table_lists')->with('success', 'Your processing has been completed.');
    }
}
