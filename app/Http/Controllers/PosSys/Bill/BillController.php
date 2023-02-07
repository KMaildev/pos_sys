<?php

namespace App\Http\Controllers\PosSys\Bill;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSubmitPayment;
use App\Models\BillInfo;
use App\Models\Customer;
use App\Models\Floor;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use App\Models\PaymentMethod;
use App\Models\TableList;
use App\Models\Taxrate;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BillController extends Controller
{

    public function billTable(Request $request)
    {
        $floors_categories = Floor::all();

        $floor = Floor::first();
        $floor_id = $request->floor_id ?? $floor->id;

        $table_lists = TableList::with('order_infos_table', 'all_order_infos_table')
            // ->where('floor_id', $floor_id)
            ->get();

        return Inertia::render('Bill/TableList', [
            'floors_categories' => $floors_categories,
            'table_lists' => $table_lists,
        ]);
    }


    public function BillPayment($id)
    {
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table')
            ->findOrFail($id);

        $customers = Customer::all();
        $payment_methods = PaymentMethod::all();
        $taxrates = Taxrate::all();

        return Inertia::render('Bill/BillPayment', [
            'order_infos' => $order_infos,
            'customers' => $customers,
            'payment_methods' => $payment_methods,
            'taxrates' => $taxrates,
        ]);
    }



    public function submitPayment(StoreSubmitPayment $request)
    {

        $order_info_id = $request->order_info_id;
        $order_info = OrderInfo::findOrFail($order_info_id);

        BillInfo::create([
            'order_info_id' => $order_info_id,
            'customer_id' => $request->customer ?? 0,
            'table_list_id' => $order_info->table_list_id,

            'bill_date_time' => date('Y-m-d h:i:s A'),
            'bill_time' => date('h:i:s A'),
            'payment_type' => $request->payment_method_id,
            'total_amount' => $order_info->total_amount,
            'tax_amount' => $request->taxrate,
            'discount' => $request->disc,
            'service_charges' => 0,
            'net_amount' => $request->totalNetAmount,
            'received_amount' => $request->received_amount,
            'change_amount' => 0,
            'cashier_user_id' => auth()->user()->id ?? 0,
            'waiter_user_id' => $order_info->waiter_user_id,
            'date_only' => date('Y-m-d'),

            'order_no' => $order_info->order_no,
            'inv_no' => $order_info->inv_no,
            'first_table_id' => $order_info->first_table_id,
        ]);

        $order_info->check_out_status = 'paid';
        $order_info->update();
    }



    public function CombineBill(Request $request)
    {
        $id = $request->order_info_id;
        $combile_order_infos = OrderInfo::where('id', '!=', $id)
            ->with('table_lists_table')
            ->get();
        return response()->json(['combile_order_infos' => $combile_order_infos]);
    }

    public function ConfirmCombine(Request $request)
    {
        $main_order_infos = $request->main_order_infos;
        $combile_order_info_id = $request->combile_order_info_id;

        $combile_order_infos = OrderItem::where('order_info_id', $combile_order_info_id)->get();
        foreach ($combile_order_infos as $key => $combile_order_info) {
            $combile_order_info->order_info_id = $main_order_infos;
            $combile_order_info->update();
        }

        Helper::updateOrderInfoTotalAmount($main_order_infos);

        OrderInfo::where('id', $combile_order_info_id)
            ->delete();
    }
}
