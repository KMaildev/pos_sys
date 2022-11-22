<?php

namespace App\Http\Controllers\Cashier\Order;

use App\Http\Controllers\Controller;
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

        $first_order_info = OrderInfo::where('check_out_status', NULL)->first();
        $first_order_info_id = $first_order_info->id ?? 1;
        $order_info_id = $request->order_info_id ?? $first_order_info_id;
        if ($order_info_id) {
            $show_order_info = OrderInfo::with('table_lists_table', 'waiter_user_table', 'customer_table')
                ->findOrFail($order_info_id);

            $order_items = OrderItem::with('menu_lists_table')
                ->where('order_info_id', $order_info_id)
                ->get();
        }

        $inv_no = $show_order_info->inv_no ?? '';
        $order_no = $show_order_info->order_no ?? '';
        $order_date_time = $show_order_info->order_date_time ?? '';
        $table_name = $show_order_info->table_lists_table->table_name ?? '';
        $guest_no = $show_order_info->guest_no ?? '';

        return Inertia::render('Cashier/Order/Index', [
            'order_infos' => $order_infos,
            'show_order_info' => $show_order_info,
            'inv_no' => $inv_no,
            'order_no' => $order_no,
            'order_date_time' => $order_date_time,
            'table_name' => $table_name,
            'guest_no' => $guest_no,

            'order_items' => $order_items,
        ]);
    }
}
