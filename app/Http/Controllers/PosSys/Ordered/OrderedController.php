<?php

namespace App\Http\Controllers\PosSys\Ordered;

use App\Http\Controllers\Controller;
use App\Models\OrderInfo;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OrderedController extends Controller
{
    public function orderedDetail($id)
    {
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table')
            ->findOrFail($id);
        return Inertia::render('Ordered/OrderedDetail', [
            'order_infos' => $order_infos,
        ]);
    }
}
