<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCustomer;
use App\Http\Requests\UpdateCustomer;
use App\Models\Customer;
use Illuminate\Http\Request;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $customers = Customer::query();
        if (request('q')) {
            $customers->where('name', 'Like', '%' . request('q') . '%');
            $customers->orWhere('customer_id', 'Like', '%' . request('q') . '%');
            $customers->orWhere('primary_number', 'Like', '%' . request('q') . '%');
            $customers->orWhere('additional_number', 'Like', '%' . request('q') . '%');
            $customers->orWhere('email', 'Like', '%' . request('q') . '%');
            $customers->orWhere('address', 'Like', '%' . request('q') . '%');
            $customers->orWhere('date_of_birth', 'Like', '%' . request('q') . '%');
            $customers->orWhere('join_date', 'Like', '%' . request('q') . '%');
            $customers->orWhere('remark', 'Like', '%' . request('q') . '%');
        }
        $customers = $customers->orderBy('id', 'ASC')->paginate(20);

        return view('customer.index', compact('customers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('customer.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCustomer $request)
    {
        $menu = new Customer();
        $menu->customer_id = IdGenerator::generate(['table' => 'customers', 'field' => 'customer_id', 'length' => 6, 'prefix' => date('y')]);
        $menu->name = $request->name;
        $menu->primary_number = $request->primary_number;
        $menu->additional_number = $request->additional_number;
        $menu->email = $request->email;
        $menu->address = $request->address;
        $menu->date_of_birth = $request->date_of_birth;
        $menu->join_date = $request->join_date;
        $menu->remark = $request->remark;
        $menu->gender = $request->gender;
        $menu->save();
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
        $customer = Customer::findOrFail($id);
        return view('customer.edit', compact('customer'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCustomer $request, $id)
    {
        $menu = Customer::findOrFail($id);
        $menu->name = $request->name;
        $menu->primary_number = $request->primary_number;
        $menu->additional_number = $request->additional_number;
        $menu->email = $request->email;
        $menu->address = $request->address;
        $menu->date_of_birth = $request->date_of_birth;
        $menu->join_date = $request->join_date;
        $menu->remark = $request->remark;
        $menu->gender = $request->gender;
        $menu->update();
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
        //
    }
}
