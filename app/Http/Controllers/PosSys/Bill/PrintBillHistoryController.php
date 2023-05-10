<?php

namespace App\Http\Controllers\PosSys\Bill;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoresubmitPrintBill;
use App\Models\OrderInfo;
use App\Models\PrintBillHistory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class PrintBillHistoryController extends Controller
{
    public function submitPrintBill(StoresubmitPrintBill $request)
    {

        $order_info_id = $request->order_info_id;
        $order_info = OrderInfo::findOrFail($order_info_id);

        PrintBillHistory::create([
            'order_info_id' => $order_info_id,
            'customer_id' => $request->customer ?? 0,
            'table_list_id' => $order_info->table_list_id,

            'bill_date_time' => date('Y-m-d h:i:s A'),
            'bill_time' => date('h:i:s A'),
            'payment_type' => $request->payment_method_id ?? 0,
            'total_amount' => $order_info->total_amount ?? 0,
            'tax_amount' => $request->taxrate ?? 0,
            'discount' => $request->disc ?? 0,
            'discount_amount' => $request->disc_amount ?? 0,

            'service_charges' => $request->service_charge ?? 0,
            'service_charge_amount' => $request->service_charge_amount ?? 0,

            'net_amount' => $request->totalNetAmount ?? 0,
            'received_amount' => $request->received_amount ?? 0,
            'refund_amount' => $request->refund_amount ?? 0,
            'change_amount' => 0,
            'cashier_user_id' => auth()->user()->id ?? 0,
            'waiter_user_id' => $order_info->waiter_user_id,
            'date_only' => date('Y-m-d'),

            'order_no' => $order_info->order_no,
            'inv_no' => $order_info->inv_no,
            'first_table_id' => $order_info->first_table_id,
        ]);

        $order_info->print_status = 'print';
        $order_info->update();

        return Redirect::route('bill_table_lists')->with('success', 'Your processing has been completed.');
    }
}
