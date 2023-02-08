<?php

namespace App\Http\Controllers\Cashier\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCustomer;
use App\Http\Requests\UpdateCustomer;
use App\Models\Customer;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Support\Facades\Redirect;

class CashierCustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $keyword = $request->keyword;
        $customers = Customer::all();

        if ($keyword) {
            $customers = Customer::where('name', 'Like', '%' . $keyword . '%')
                ->orWhere('customer_id', 'Like', '%' . $keyword . '%')
                ->orWhere('primary_number', 'Like', '%' . $keyword . '%')
                ->orWhere('additional_number', 'Like', '%' . $keyword . '%')
                ->orWhere('email', 'Like', '%' . $keyword . '%')
                ->orWhere('address', 'Like', '%' . $keyword . '%')
                ->orWhere('date_of_birth', 'Like', '%' . $keyword . '%')
                ->orWhere('join_date', 'Like', '%' . $keyword . '%')
                ->orWhere('remark', 'Like', '%' . $keyword . '%')
                ->get();
        }
        return Inertia::render('Customer/Index', [
            'customers' => $customers,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Inertia::render('Customer/Create', [
            'customer' => new Customer(),
        ]);
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
        return Redirect::route('cashier_customer')->with('success', 'Your processing has been completed.');
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
    public function edit(Customer $customer)
    {
        return Inertia::render('Customer/Edit', compact('customer'));
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
        return Redirect::route('cashier_customer')->with('success', 'Your processing has been completed.');
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
