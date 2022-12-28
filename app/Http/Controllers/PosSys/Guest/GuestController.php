<?php

namespace App\Http\Controllers\PosSys\Guest;

use App\Http\Controllers\Controller;
use App\Models\OrderInfo;
use Illuminate\Http\Request;
use Inertia\Inertia;

class GuestController extends Controller
{

    public function index(Request $request)
    {
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table')
            ->orderBy('id', 'desc')
            ->get();

        return Inertia::render('Guest/Index', [
            'order_infos' => $order_infos,
        ]);
    }
}
