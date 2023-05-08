<?php

namespace App\Http\Controllers;

use App\Models\BillInfo;
use App\Models\Customer;
use App\Models\Department;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use App\Models\User;
use Carbon\Carbon;
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

        // Count Data
        $allOrderCount = OrderInfo::count();
        $todayOrderCount = OrderInfo::whereDay('created_at', date('d'))->count();

        $allIncome = BillInfo::sum('total_amount');
        $todayIncome = BillInfo::whereDay('created_at', date('d'))->sum('total_amount');

        $allCustomer = Customer::count();
        $todayCustomer = Customer::whereDay('created_at', date('d'))->count();

        $allOrderQty = OrderItem::count();
        $todayOrderQty = OrderItem::whereDay('created_at', date('d'))->sum('qty');


        // Sale Data Chart 
        $months = [date('F')];
        $yearMonths = [
            [
                'year' => date('Y'),
                'month' => date('m'),
            ]
        ];

        for ($i = 1; $i <= 6; $i++) {
            $months[] = date('F', strtotime("-$i month"));

            $yearMonths[] = [
                'year' => date('Y', strtotime("-$i month")),
                'month' => date('m', strtotime("-$i month")),
            ];
        }

        $saleData = [];
        foreach ($yearMonths as $key => $ym) {
            $saleData[] =  BillInfo::whereYear('created_at', $ym['year'])->whereMonth('created_at', $ym['month'])->count();
        }
        // Sale Data Chart End

        // Daily Income
        $dayMonths = [date('F d')];
        $dayMonthsData = [
            [
                'day' => date('d'),
                'month' => date('m'),
            ]
        ];

        for ($i = 1; $i <= 6; $i++) {
            $dayMonths[] = date('F d', strtotime("-$i day"));

            $dayMonthsData[] = [
                'day' => date('d', strtotime("-$i day")),
                'month' => date('m', strtotime("-$i month")),
            ];
        }

        $DailyIncome = [];
        foreach ($dayMonthsData as $key => $dm) {
            $DailyIncome[] =  BillInfo::whereDay('created_at', $dm['day'])->whereMonth('created_at', $dm['month'])->sum('total_amount');
        }
        // Daily Income End

        // Category Sale Report 
        $categories = ['Beverage', 'Food'];
        $categorySaleReport = [];
        foreach ($categories as $key => $value) {
            $categorySaleReport[] = OrderItem::where('type', $value)->sum('qty');
        }


        // itemsSaleReport
        $menuNameData = [];
        $menuQtyData = [];
        $menu_names = OrderItem::groupBy('menu_name')->get();
        foreach ($menu_names as $key => $value) {
            $menuNameData[] = $value->menu_name;
            $menuQtyData[] = OrderItem::where('menu_name', $value->menu_name)->sum('qty');
        }

        // Sale Data Chart End


        // Hourly Report
        $hourlyData = [date('h:i:s')];
        $hourlyDataData = [
            [
                'hourly' => date('h:i:s'),
            ]
        ];

        for ($i = 1; $i <= 6; $i++) {
            $hourlyData[] = date('h:i:s', strtotime("-$i hour"));

            $hourlyDataData[] = [
                'hourly' => date('h:i:s', strtotime("-$i hour")),
            ];
        }


        $HourlyIncome = [];
        foreach ($hourlyDataData as $key => $h) {
            //   BillInfo::where('date_only', date('Y-m-d'))->whereTime('created_at' <= $h['hourly'])->sum('total_amount');
        }
        // Hourly Report



        if ($departmemt->title == 'Waiter') {
            return redirect()->route('pos_table_lists');
        } elseif ($departmemt->title == 'Cashier') {
            return redirect()->route('pos_table_lists');
        } else {
            return view('home', compact('allOrderCount', 'todayOrderCount', 'allIncome', 'todayIncome', 'allCustomer', 'todayCustomer', 'allOrderQty', 'todayOrderQty', 'months', 'saleData', 'dayMonths', 'DailyIncome', 'categories', 'categorySaleReport', 'menuNameData', 'menuQtyData', 'hourlyData', 'HourlyIncome'));
        }
    }
}
