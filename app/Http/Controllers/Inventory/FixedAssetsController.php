<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreFixedAssets;
use App\Http\Requests\UpdateFixedAssets;
use App\Models\FixedAssets;
use App\Models\Store;
use Illuminate\Http\Request;

class FixedAssetsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fixed_assets = FixedAssets::query();
        if (request('q')) {
            $fixed_assets->where('inventory_code', 'Like', '%' . request('q') . '%');
            $fixed_assets->orWhere('description', 'Like', '%' . request('q') . '%');
        }
        $fixed_assets = $fixed_assets->orderBy('inventory_code', 'ASC')->get();
        return view('inventory.fixed_assets.index', compact('fixed_assets'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $stores = Store::all();
        return view('inventory.fixed_assets.create', compact('stores'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreFixedAssets $request)
    {
        $store = new FixedAssets();
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
        $fixed_asset = FixedAssets::findOrFail($id);
        $stores = Store::all();
        return view('inventory.fixed_assets.edit', compact('fixed_asset', 'stores'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateFixedAssets $request, $id)
    {
        $store = FixedAssets::findOrFail($id);
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
        $floor = FixedAssets::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Successfully Processed!');
    }
}
