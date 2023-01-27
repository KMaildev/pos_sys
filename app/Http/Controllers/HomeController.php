<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use LaravelDaily\LaravelCharts\Classes\LaravelChart;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $department_id = auth()->user()->department_id;
        $departmemt = Department::findOrFail($department_id);

        $chart_options = [
            'chart_title' => 'Customers by months',
            'report_type' => 'group_by_date',
            'model' => 'App\Models\Customer',
            'group_by_field' => 'created_at',
            'group_by_period' => 'month',
            'chart_type' => 'bar',
            'filter_field' => 'created_at',
            'filter_days' => 30, // show only last 30 days
        ];
        $customers = new LaravelChart($chart_options);


        $chart_options = [
            'chart_title' => 'Daily Income',
            'report_type' => 'group_by_date',
            'model' => 'App\Models\BillInfo',
            'group_by_field' => 'created_at',
            'group_by_period' => 'day',
            'aggregate_function' => 'sum',
            'aggregate_field' => 'total_amount',
            'chart_type' => 'line',
        ];
        $bill_infos = new LaravelChart($chart_options);


        $chart_options = [
            'chart_title' => 'Sold out qty',
            'report_type' => 'group_by_string',
            'model' => 'App\Models\OrderItem',
            'group_by_field' => 'menu_name',
            'chart_type' => 'pie',
            'filter_field' => 'created_at',
            'aggregate_function' => 'sum',
            'aggregate_field' => 'qty',
            'filter_period' => 'month', // show users only registered this month
        ];
        $order_items = new LaravelChart($chart_options);


        $chart_options = [
            'chart_title' => 'Revenue of Menu',
            'report_type' => 'group_by_string',
            'model' => 'App\Models\OrderItem',
            'group_by_field' => 'menu_name',
            'chart_type' => 'pie',
            'filter_field' => 'created_at',
            'aggregate_function' => 'sum',
            'aggregate_field' => 'price',
            'filter_period' => 'month', // show users only registered this month
        ];
        $order_items_price = new LaravelChart($chart_options);

        if ($departmemt->title == 'Waiter') {
            return redirect()->route('pos_table_lists');
        } elseif ($departmemt->title == 'Cashier') {
            return redirect()->route('pos_table_lists');
        } else {
            return view('home', compact('customers', 'bill_infos', 'order_items', 'order_items_price'));
        }
    }
}
