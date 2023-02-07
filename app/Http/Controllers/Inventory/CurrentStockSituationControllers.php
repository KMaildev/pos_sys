<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Ingredients;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class CurrentStockSituationControllers extends Controller
{
    public function index(Request $request)
    {
        $ingredients = Ingredients::all();
        $order_items = OrderItem::all();
        return view('current_stock_situation.index', compact('ingredients', 'order_items'));
    }
}
