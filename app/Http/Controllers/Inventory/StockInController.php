<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreStockIn;
use App\Models\Ingredients;
use App\Models\StockIn;
use App\Models\Store;
use Illuminate\Http\Request;

class StockInController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $start_date = $request->start_date ?? date('Y-m-d', strtotime('first day of this month'));
        $end_date = $request->end_date ?? date('Y-m-d', strtotime('last day of this month'));

        $stock_openings = StockIn::whereDate('stock_in_date', '>=', $start_date)
            ->whereDate('stock_in_date', '<=', $end_date)
            ->paginate(100);

        return view('stock_in.index', compact('stock_openings', 'start_date', 'end_date'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $ingredients = Ingredients::all();
        $stores = Store::all();
        return view('stock_in.create', compact('ingredients', 'stores'));
    }


    public function stockInEntryAjax(Request $request)
    {
        $session_id = session()->getId();
        $stock_openings = StockIn::with('ingredient_table', 'store_table')
            ->where('session_id', $session_id)
            ->get();
        echo json_encode($stock_openings);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreStockIn $request)
    {
        $stock_opening = new StockIn();
        $stock_opening->ingredient_id = $request->ingredient_id;
        $stock_opening->stock_in_date = $request->stock_in_date;
        $stock_opening->purchase_unit = $request->purchase_unit;
        $stock_opening->price_per_unit = $request->price_per_unit;
        $stock_opening->total_stock_value = $request->total_stock_value;
        $stock_opening->store_id = $request->store_id;
        $stock_opening->user_id = auth()->user()->id ?? 0;
        $stock_opening->session_id = session()->getId();
        $stock_opening->save();
        return json_encode(array(
            "statusCode" => 200,
        ));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $temp = StockIn::findOrFail($id);
        $temp->delete();
        return redirect()->back()->with('success', 'Deleted successfully.');
    }

    public function confirmStockIn()
    {
        $session_id = session()->getId();
        $stock_openings = StockIn::with('ingredient_table', 'store_table')
            ->where('session_id', $session_id)
            ->get();
        foreach ($stock_openings as $key => $value) {
            $id = $value->id;
            $temp = StockIn::findOrFail($id);
            $temp->session_id = null;
            $temp->update();
        }
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    public function removeStockIn($id)
    {
        $temp = StockIn::findOrFail($id);
        $temp->delete();
        return json_encode(array(
            "statusCode" => 200,
        ));
    }
}
