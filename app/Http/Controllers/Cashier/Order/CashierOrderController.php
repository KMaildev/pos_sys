<?php

namespace App\Http\Controllers\Cashier\Order;

use App\Http\Controllers\Controller;
use App\Models\BillInfo;
use App\Models\Customer;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CashierOrderController extends Controller
{
    public function index(Request $request)
    {
        $keyword = $request->keyword;
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'customer_table')
            ->where('check_out_status', NULL)
            ->orderBy('id', 'desc')
            ->get();

        if ($keyword) {
            $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'customer_table')
                ->where('check_out_status', NULL)
                ->whereRelation('table_lists_table', 'table_name', 'like', '%' . $keyword . '%')
                ->orWhereRelation('waiter_user_table', 'name', 'like', '%' . $keyword . '%')
                ->orderBy('id', 'desc')
                ->get();
        }

        return Inertia::render('Cashier/Order/Index', [
            'order_infos' => $order_infos,
        ]);
    }

    public function viewOrderDetail($id)
    {
        $show_order_info = OrderInfo::with('table_lists_table', 'waiter_user_table', 'customer_table')
            ->findOrFail($id);

        $order_items = OrderItem::with('menu_lists_table')
            ->where('order_info_id', $id)
            ->get();

        $bill_infos = BillInfo::where('order_info_id', $id)
            ->first();

        $customers = Customer::all();

        return Inertia::render('Cashier/Order/ShowInvoice', [
            'show_order_info' => $show_order_info,
            'order_items' => $order_items,
            'customers' => $customers,
            'bill_infos' => $bill_infos,
        ]);
    }

    public function previewPayment(Request $request)
    {

        $order_info_id = $request->show_order_info;
        $order_info = OrderInfo::findOrFail($order_info_id);

        $order_info->check_out_time = date('Y-m-d h:i:s A');
        $order_info->payment_type = $request->payment_type;
        $order_info->total_amount = $order_info->total_amount;
        $order_info->tax_amount = $request->tax;
        $order_info->discount = $request->disc;
        $order_info->service_charges = $request->service_charges;
        $order_info->net_amount = $request->net_amount;
        $order_info->received_amount = $request->received_amount;
        $order_info->change_amount = $request->change_amount;
        $order_info->cashier_user_id = auth()->user()->id ?? 0;
        $order_info->update();
    }


    public function submitPayment(Request $request)
    {

        $order_info_id = $request->show_order_info;
        $order_info = OrderInfo::findOrFail($order_info_id);

        BillInfo::create([
            'order_info_id' => $order_info_id,
            'customer_id' => $request->customer ?? 0,
            'table_list_id' => $order_info->table_list_id,

            'bill_date_time' => date('Y-m-d h:i:s A'),
            'bill_time' => date('h:i:s A'),
            'payment_type' => $request->payment_type,

            'total_amount' => $order_info->total_amount,

            'tax_amount' => $request->tax,
            'discount' => $request->disc,
            'service_charges' => $request->service_charges,
            'net_amount' => $request->net_amount,
            'received_amount' => $request->received_amount,
            'change_amount' => $request->change_amount,
            'cashier_user_id' => auth()->user()->id ?? 0,
            'waiter_user_id' => $order_info->waiter_user_id,
            'date_only' => date('Y-m-d'),
        ]);
    }
}
