<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreServiceCharge;
use App\Http\Requests\UpdateServiceCharge;
use App\Models\ServiceCharge;
use Illuminate\Http\Request;

class ServiceChargesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $stores = ServiceCharge::query();
        if (request('q')) {
            $stores->where('name', 'Like', '%' . request('q') . '%');
            $stores->orWhere('rate', 'Like', '%' . request('q') . '%');
        }
        $stores = $stores->get();
        return view('system.service_charge.index', compact('stores'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('system.service_charge.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreServiceCharge $request)
    {
        $store = new ServiceCharge();
        $store->name = $request->name;
        $store->rate = $request->rate ?? 0;
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
        $store = ServiceCharge::findOrFail($id);
        return view('system.service_charge.edit', compact('store'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateServiceCharge $request, $id)
    {
        $store = ServiceCharge::findOrFail($id);
        $store->name = $request->name;
        $store->rate = $request->rate ?? 0;
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
        $floor = ServiceCharge::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
