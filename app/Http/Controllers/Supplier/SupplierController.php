<?php

namespace App\Http\Controllers\Supplier;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSupplier;
use App\Http\Requests\UpdateSupplier;
use App\Models\Supplier;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suppliers = Supplier::query();
        if (request('q')) {
            $suppliers->where('name', 'Like', '%' . request('q') . '%');
            $suppliers->orWhere('shop_name', 'Like', '%' . request('q') . '%');
            $suppliers->orWhere('phone', 'Like', '%' . request('q') . '%');
            $suppliers->orWhere('email', 'Like', '%' . request('q') . '%');
            $suppliers->orWhere('address', 'Like', '%' . request('q') . '%');
            $suppliers->orWhere('remark', 'Like', '%' . request('q') . '%');
        }
        $suppliers = $suppliers->get();
        return view('supplier.index', compact('suppliers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('supplier.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSupplier $request)
    {
        $store = new Supplier();
        $store->name = $request->name;
        $store->shop_name = $request->shop_name;
        $store->phone = $request->phone;
        $store->email = $request->email;
        $store->address = $request->address;
        $store->remark = $request->remark;
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
        $supplier = Supplier::findOrFail($id);
        return view('supplier.edit', compact('supplier'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSupplier $request, $id)
    {
        $store = Supplier::findOrFail($id);
        $store->name = $request->name;
        $store->shop_name = $request->shop_name;
        $store->phone = $request->phone;
        $store->email = $request->email;
        $store->address = $request->address;
        $store->remark = $request->remark;
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
        $floor = Supplier::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
