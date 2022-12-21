<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreVariableAssets;
use App\Http\Requests\UpdateVariableAssets;
use App\Models\Store;
use App\Models\VariableAssets;
use Illuminate\Http\Request;

class VariableAssetsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $variable_assets = VariableAssets::query();
        if (request('q')) {
            $variable_assets->where('inventory_code', 'Like', '%' . request('q') . '%');
            $variable_assets->orWhere('description', 'Like', '%' . request('q') . '%');
        }
        $variable_assets = $variable_assets->orderBy('inventory_code', 'ASC')->get();
        return view('inventory.variable_assets.index', compact('variable_assets'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $stores = Store::all();
        return view('inventory.variable_assets.create', compact('stores'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreVariableAssets $request)
    {
        $store = new VariableAssets();
        $store->inventory_code = $request->inventory_code;
        $store->description = $request->description;
        $store->unit = $request->unit;
        $store->store_id = $request->store_id;
        $store->user_id = auth()->user()->id ?? 0;
        $store->save();
        return redirect()->back()->with('success', 'Successfully Processed!');
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
        $fixed_asset = VariableAssets::findOrFail($id);
        $stores = Store::all();
        return view('inventory.variable_assets.edit', compact('fixed_asset', 'stores'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateVariableAssets $request, $id)
    {
        $store = VariableAssets::findOrFail($id);
        $store->inventory_code = $request->inventory_code;
        $store->description = $request->description;
        $store->unit = $request->unit;
        $store->store_id = $request->store_id;
        $store->user_id = auth()->user()->id ?? 0;
        $store->update();
        return redirect()->back()->with('success', 'Successfully Processed!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $floor = VariableAssets::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Successfully Processed!');
    }
}
