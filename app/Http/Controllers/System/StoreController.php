<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreStore;
use App\Http\Requests\UpdateStore;
use App\Models\Store;
use Illuminate\Http\Request;

class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $stores = Store::query();
        if (request('q')) {
            $stores->where('name', 'Like', '%' . request('q') . '%');
            $stores->orWhere('code_name', 'Like', '%' . request('q') . '%');
            $stores->orWhere('address', 'Like', '%' . request('q') . '%');
        }
        $stores = $stores->get();
        return view('system.store.index', compact('stores'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('system.store.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreStore $request)
    {
        $store = new Store();
        $store->name = $request->name;
        $store->code_name = $request->code_name;
        $store->address = $request->address;
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
        $store = Store::findOrFail($id);
        return view('system.store.edit', compact('store'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateStore $request, $id)
    {
        $store = Store::findOrFail($id);
        $store->name = $request->name;
        $store->code_name = $request->code_name;
        $store->address = $request->address;
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
        $floor = Store::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
