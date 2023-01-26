<?php

namespace App\Http\Controllers\PosSys\Report;

use App\Http\Controllers\Controller;
use App\Models\BillInfo;
use App\Models\User;
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
            ->where('department_id', 4)
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

        return Inertia::render('Report/StaffSales', [
            'waiters' => $waiters,
        ]);
    }



    public function TablesSales(Request $request)
    {
        return Inertia::render('Report/SalesReport');
    }

    public function PaymentTypesReport(Request $request)
    {
        return Inertia::render('Report/SalesReport');
    }

    public function DiscountReport(Request $request)
    {
        return Inertia::render('Report/SalesReport');
    }

    public function VoidReport(Request $request)
    {
        return Inertia::render('Report/SalesReport');
    }
}
