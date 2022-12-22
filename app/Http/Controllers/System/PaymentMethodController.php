<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePaymentMethod;
use App\Http\Requests\UpdatePaymentMethod;
use App\Models\PaymentMethod;
use Illuminate\Http\Request;

class PaymentMethodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $stores = PaymentMethod::query();
        if (request('q')) {
            $stores->where('name', 'Like', '%' . request('q') . '%');
            $stores->orWhere('remark', 'Like', '%' . request('q') . '%');
        }
        $stores = $stores->get();
        return view('system.payment_method.index', compact('stores'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('system.payment_method.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePaymentMethod $request)
    {
        $store = new PaymentMethod();
        $store->name = $request->name;
        $store->remark = $request->remark ?? 0;
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
        $store = PaymentMethod::findOrFail($id);
        return view('system.payment_method.edit', compact('store'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePaymentMethod $request, $id)
    {
        $store = PaymentMethod::findOrFail($id);
        $store->name = $request->name;
        $store->remark = $request->remark ?? 0;
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
        $floor = PaymentMethod::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
