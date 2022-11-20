<?php

namespace App\Helpers;

use App\Models\OrderInfo;
use App\Models\OrderItem;

class Helper
{
    public function updateOrderInfoTotalAmount($order_info_id)
    {
        $order_items = OrderItem::where('order_info_id', $order_info_id)->get();
        $total_amount_arr = [];
        foreach ($order_items as $key => $order_item) {
            if ($order_item->preparation_status == 'Reject') {
                $price = 0;
                $qty = 0;
            } else {
                $price = $order_item->price ?? 0;
                $qty = $order_item->qty ?? 0;
            }
            $total_amount = $price * $qty;
            $total_amount_arr[] = $total_amount;
        }
        $total_amount_arr = array_sum($total_amount_arr);
        $order_info = OrderInfo::findOrFail($order_info_id);
        $order_info->total_amount = $total_amount_arr;
        $order_info->update();
        return true;
    }
}
