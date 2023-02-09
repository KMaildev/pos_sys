<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Ingredients;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class StockOutController extends Controller
{
    public function index(Request $request)
    {
        $start_date = $request->start_date ?? date('Y-m-d', strtotime('first day of this month'));
        $end_date = $request->end_date ?? date('Y-m-d', strtotime('last day of this month'));

        $order_items = OrderItem::whereDate('order_date', '>=', $start_date)
            ->whereDate('order_date', '<=', $end_date)
            ->with('ingredient_lists')
            ->paginate(100);
        return view('stock_out.index', compact('order_items', 'start_date', 'end_date'));
    }
}
