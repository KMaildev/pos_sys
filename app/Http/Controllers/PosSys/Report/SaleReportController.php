<?php

namespace App\Http\Controllers\PosSys\Report;

use App\Http\Controllers\Controller;
use App\Models\BillInfo;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SaleReportController extends Controller
{
    public function SaleReport(Request $request)
    {
        $bill_infos = BillInfo::with('table_lists_table', 'first_table_lists_table', 'cashier_user', 'waiter_user_table', 'payment_method_table', 'order_items_table', 'void_items_table')
            ->get();

        return Inertia::render(
            'Report/SalesReport',
            [
                'bill_infos' => $bill_infos,
            ]
        );
    }

    public function StaffSales(Request $request)
    {
        return Inertia::render('Report/SalesReport');
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
