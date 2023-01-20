<?php

namespace App\Http\Controllers\PosSys\Split;

use App\Http\Controllers\Controller;
use App\Models\OrderInfo;
use Illuminate\Http\Request;
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
}
