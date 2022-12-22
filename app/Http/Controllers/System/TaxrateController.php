<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTaxrate;
use App\Http\Requests\UpdateTaxrate;
use App\Models\Taxrate;
use Illuminate\Http\Request;

class TaxrateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $stores = Taxrate::query();
        if (request('q')) {
            $stores->where('name', 'Like', '%' . request('q') . '%');
            $stores->orWhere('taxrate', 'Like', '%' . request('q') . '%');
        }
        $stores = $stores->get();
        return view('system.taxrate.index', compact('stores'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('system.taxrate.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreTaxrate $request)
    {
        $store = new Taxrate();
        $store->name = $request->name;
        $store->taxrate = $request->taxrate ?? 0;
        $store->status = $request->status;
        $store->user_id = auth()->user()->id ?? 0;
        $store->save();
        return redirect()->back()->with('success', 'Your processing has been completed.');
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
        $store = Taxrate::findOrFail($id);
        return view('system.taxrate.edit', compact('store'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateTaxrate $request, $id)
    {
        $store = Taxrate::findOrFail($id);
        $store->name = $request->name;
        $store->taxrate = $request->taxrate ?? 0;
        $store->status = $request->status;
        $store->user_id = auth()->user()->id ?? 0;
        $store->update();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $floor = Taxrate::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
