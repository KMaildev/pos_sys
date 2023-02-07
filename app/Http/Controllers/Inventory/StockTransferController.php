<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreStockTransfer;
use App\Http\Requests\UpdateStockTransfer;
use App\Models\Ingredients;
use App\Models\StockTransfer;
use App\Models\Store;
use Illuminate\Http\Request;

class StockTransferController extends Controller
{
    public function index(Request $request)
    {
        $stock_transfers = StockTransfer::all();
        return view('stock_transfer.index', compact('stock_transfers'));
    }

    public function create(Request $request)
    {
        $ingredients = Ingredients::all();
        $stores = Store::all();
        return view('stock_transfer.create', compact('ingredients', 'stores'));
    }

    public function store(StoreStockTransfer $request)
    {
        $stock_opening = new StockTransfer();
        $stock_opening->ingredient_id = $request->ingredient_id;
        $stock_opening->transfer_date = $request->transfer_date;
        $stock_opening->transfer_unit = $request->transfer_unit;
        $stock_opening->location_from_store_id = $request->location_from_store_id;
        $stock_opening->to_location_store_id = $request->to_location_store_id;
        $stock_opening->user_id = auth()->user()->id ?? 0;
        $stock_opening->save();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    public function edit($id)
    {
        $ingredients = Ingredients::all();
        $stores = Store::all();
        $stock_transfer = StockTransfer::findOrFail($id);
        return view('stock_transfer.edit', compact('ingredients', 'stores', 'stock_transfer'));
    }

    public function update(UpdateStockTransfer $request, $id)
    {
        $stock_opening = StockTransfer::findOrFail($id);
        $stock_opening->ingredient_id = $request->ingredient_id;
        $stock_opening->transfer_date = $request->transfer_date;
        $stock_opening->transfer_unit = $request->transfer_unit;
        $stock_opening->location_from_store_id = $request->location_from_store_id;
        $stock_opening->to_location_store_id = $request->to_location_store_id;
        $stock_opening->user_id = auth()->user()->id ?? 0;
        $stock_opening->update();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    public function destroy($id)
    {
        $floor = StockTransfer::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
