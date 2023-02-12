<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreDiscount;
use App\Http\Requests\UpdateDiscount;
use App\Models\Discount;
use Illuminate\Http\Request;

class DiscountController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $stores = Discount::query();
        if (request('q')) {
            $stores->where('name', 'Like', '%' . request('q') . '%');
            $stores->orWhere('rate', 'Like', '%' . request('q') . '%');
        }
        $stores = $stores->get();
        return view('system.discount.index', compact('stores'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('system.discount.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreDiscount $request)
    {
        $store = new Discount();
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
        $store = Discount::findOrFail($id);
        return view('system.discount.edit', compact('store'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateDiscount $request, $id)
    {
        $store = Discount::findOrFail($id);
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
        $floor = Discount::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
