<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Ingredients;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class StockLedgerController extends Controller
{
    public function index(Request $request)
    {
        $ingredients = Ingredients::all();
        $order_items = OrderItem::all();
        return view('stock_ledger.index', compact('ingredients', 'order_items'));
    }
}
