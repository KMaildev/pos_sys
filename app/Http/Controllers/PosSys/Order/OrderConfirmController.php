<?php

namespace App\Http\Controllers\PosSys\Order;

use App\Http\Controllers\Controller;
use App\Models\CartTemp;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use App\Helpers\Helper;

class OrderConfirmController extends Controller
{
    public function store(Request $request)
    {

        $session_id = session()->getId();
        $user_id = auth()->user()->id ?? 0;
        $temporary_order_items = CartTemp::where('session_id', $session_id)
            ->where('user_id', $user_id)
            ->get();

        $itemCount = count($temporary_order_items);

        if ($itemCount > 0) {
            $countOrderInfo = OrderInfo::count();
            $order_no = sprintf('%06d', $countOrderInfo + 1);

            $inv_count_no = sprintf('%04d', $countOrderInfo + 1);
            $date = date('dmY');
            $inv_no = sprintf('INV-' . $date . '-' . $inv_count_no);

            $order_infos_check = OrderInfo::where('table_list_id', $request->table_list_id)
                ->where('check_out_time', NULL)
                ->where('check_out_status', NULL)
                ->first();

            $order_info = OrderInfo::updateOrCreate(
                [
                    'table_list_id' => $request->table_list_id,
                    'check_out_time' => NULL,
                    'check_out_status' => NULL,
                ],
                [
                    'customer_id' => $request->customer_id ?? 0,
                    'table_list_id' => $request->table_list_id,
                    'guest_no' => $request->guest_no ?? 0,
                    'order_date_time' => $order_infos_check->order_date_time ?? date('Y-m-d h:i:s A'),
                    'order_date' => $order_infos_check->order_date ?? date('Y-m-d'),
                    'order_time' => $order_infos_check->order_time ?? date('h:i:s A'),
                    'total_amount' => 0,
                    'cashier_user_id' => auth()->user()->id ?? 0,
                    'waiter_user_id' => auth()->user()->id ?? 0,
                    'order_no' => $order_infos_check->order_no ?? $order_no,
                    'inv_no' => $order_infos_check->inv_no ?? $inv_no,
                ],
            );
            $order_info_id = $order_info->id;

            foreach ($temporary_order_items as $key => $value) {
                OrderItem::create([
                    'menu_list_id' => $value['menu_list_id'],
                    'qty' => $value['qty'],
                    'price' => $value['price'],
                    'remark' => $value['remark'],
                    'order_info_id' => $order_info_id,
                    'waiter_user_id' => $user_id,
                ]);
            }
            Helper::updateOrderInfoTotalAmount($order_info_id);

            CartTemp::where('session_id', $session_id)
                ->where('user_id', $user_id)
                ->delete();
            return redirect()->back()->with('success', 'Success');
        } else {
            return redirect()->back()->with('error', 'Error');
        }
    }

    public function store_test(Request $request)
    {
        $items = $request->cart_lists;
        foreach ($items as $key => $value) {
            CartTemp::create([
                'remark' => $value['menu_name'],
                'qty' => $value['qty'],
            ]);
        }
    }
}
