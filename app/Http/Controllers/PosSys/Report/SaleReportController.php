<?php

namespace App\Http\Controllers\PosSys\Report;

use App\Http\Controllers\Controller;
use App\Models\BillInfo;
use App\Models\Category;
use App\Models\OrderItem;
use App\Models\PaymentMethod;
use App\Models\TableList;
use App\Models\User;
use App\Models\VoidItem;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SaleReportController extends Controller
{

    public function SaleReport(Request $request)
    {

        $bill_infos = BillInfo::with('table_lists_table', 'first_table_lists_table', 'cashier_user', 'waiter_user_table', 'payment_method_table', 'order_items_table', 'void_items_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $bill_infos = BillInfo::with('table_lists_table', 'first_table_lists_table', 'cashier_user', 'waiter_user_table', 'payment_method_table', 'order_items_table', 'void_items_table')
                ->where('date_only', '>=', request('start_date'))
                ->where('date_only', '<=', request('end_date'))
                ->get();
        }

        return Inertia::render('Report/SalesReport', [
            'bill_infos' => $bill_infos,
        ]);
    }


    public function StaffSales(Request $request)
    {
        $waiters = User::with('bill_infos_table', 'void_items_table', 'remark_void_items_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $start_date =  request('start_date');
            $end_date =  request('end_date');
            $waiters = User::where('department_id', 4)
                ->with(['bill_infos_table' => function ($query) use ($start_date, $end_date) {
                    $query->where('date_only', '>=', $start_date);
                    $query->where('date_only', '<=', $end_date);
                }])
                ->with('void_items_table', 'remark_void_items_table')
                ->get();
        }

        $bill_infos = BillInfo::all();
        $void_items = VoidItem::all();

        return Inertia::render('Report/StaffSales', [
            'waiters' => $waiters,
            'bill_infos' => $bill_infos,
            'void_items' => $void_items,
        ]);
    }



    public function TablesSales(Request $request)
    {
        $table_lists = TableList::with('bill_infos_table', 'void_item_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $start_date =  request('start_date');
            $end_date =  request('end_date');
            $table_lists = TableList::with(['bill_infos_table' => function ($query) use ($start_date, $end_date) {
                $query->where('date_only', '>=', $start_date);
                $query->where('date_only', '<=', $end_date);
            }])->with('void_item_table')
                ->get();
        }

        $bill_infos_table = BillInfo::all();
        return Inertia::render('Report/TablesSales', [
            'table_lists' => $table_lists,
            'bill_infos_table' => $bill_infos_table,
        ]);
    }



    public function PaymentTypesReport(Request $request)
    {
        $payment_methods = PaymentMethod::with('bill_infos_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $start_date =  request('start_date');
            $end_date =  request('end_date');
            $payment_methods = PaymentMethod::with(['bill_infos_table' => function ($query) use ($start_date, $end_date) {
                $query->where('date_only', '>=', $start_date);
                $query->where('date_only', '<=', $end_date);
            }])->get();
        }

        $bill_infos_table = BillInfo::all();

        return Inertia::render('Report/PaymentTypesReport', [
            'payment_methods' => $payment_methods,
            'bill_infos_table' => $bill_infos_table,
        ]);
    }



    public function DiscountReport(Request $request)
    {
        $bill_infos = BillInfo::with('table_lists_table', 'first_table_lists_table', 'cashier_user', 'waiter_user_table', 'payment_method_table', 'order_items_table', 'void_items_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $bill_infos = BillInfo::with('table_lists_table', 'first_table_lists_table', 'cashier_user', 'waiter_user_table', 'payment_method_table', 'order_items_table', 'void_items_table')
                ->where('date_only', '>=', request('start_date'))
                ->where('date_only', '<=', request('end_date'))
                ->get();
        }

        return Inertia::render('Report/DiscountReport', [
            'bill_infos' => $bill_infos,
        ]);
    }

    public function DiscountAMPReport(Request $request)
    {
        $bill_infos = BillInfo::with('table_lists_table', 'first_table_lists_table', 'cashier_user', 'waiter_user_table', 'payment_method_table', 'order_items_table', 'void_items_table')
            ->where('discount', 100)
            ->get();

        if (request('start_date') && request('end_date')) {
            $bill_infos = BillInfo::with('table_lists_table', 'first_table_lists_table', 'cashier_user', 'waiter_user_table', 'payment_method_table', 'order_items_table', 'void_items_table')
                ->where('date_only', '>=', request('start_date'))
                ->where('date_only', '<=', request('end_date'))
                ->get();
        }

        return Inertia::render('Report/DiscountAmpReport', [
            'bill_infos' => $bill_infos,
        ]);
    }




    public function VoidReport(Request $request)
    {
        $void_items = VoidItem::with('menu_list_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $void_items = VoidItem::with('menu_list_table')
                ->where('void_date', '>=', request('start_date'))
                ->where('void_date', '<=', request('end_date'))
                ->get();
        }
        return Inertia::render('Report/VoidReport', [
            'void_items' => $void_items,
        ]);
    }

    public function XReport()
    {

        // Order Item 
        $category_arr = [];
        $order_items = OrderItem::groupBy('categorie_id')
            ->where('order_date', '2023-05-11')
            ->get();
        foreach ($order_items as $key => $order_item) {
            $category_arr[] = $order_item->categorie_id;
        }

        // Category with Order Item 
        $categories = Category::with('order_items')
            ->whereHas('order_items', function ($q) use ($category_arr) {
                $q->whereIn('categorie_id', $category_arr);
            })->get();

        $bill_infos = BillInfo::where('date_only', '2023-05-11')
            ->get();

        return Inertia::render('Report/Xreport', [
            'categories' => $categories,
            'bill_infos' => $bill_infos,
        ]);
    }


    public function YReport()
    {
        $void_items = VoidItem::with('menu_list_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $void_items = VoidItem::with('menu_list_table')
                ->where('void_date', '>=', request('start_date'))
                ->where('void_date', '<=', request('end_date'))
                ->get();
        }
        return Inertia::render('Report/Yreport', [
            'void_items' => $void_items,
        ]);
    }
}
