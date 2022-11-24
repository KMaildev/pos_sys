<?php

namespace App\Http\Controllers\Cashier\CompletedOrder;

use App\Http\Controllers\Controller;
use App\Models\BillInfo;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CashierCompletedOrderController extends Controller
{
    public function index(Request $request)
    {
        $bill_infos = BillInfo::with('order_infos_table', 'table_lists_table', 'cashier_user', 'customer_table', 'waiter_user_table')
            ->orderBy('id', 'desc')
            ->get();

        $keyword = $request->keyword;
        if ($keyword) {
            $bill_infos = BillInfo::with('order_infos_table', 'table_lists_table', 'cashier_user', 'customer_table', 'waiter_user_table')
                ->whereRelation('order_infos_table', 'order_no', 'like', '%' . $keyword . '%')
                ->orWhereRelation('order_infos_table', 'inv_no', 'like', '%' . $keyword . '%')
                ->orWhereRelation('cashier_user', 'name', 'like', '%' . $keyword . '%')
                ->orWhereRelation('waiter_user_table', 'name', 'like', '%' . $keyword . '%')
                ->orWhereRelation('table_lists_table', 'table_name', 'like', '%' . $keyword . '%')
                ->orderBy('id', 'desc')
                ->get();
        }

        $start_date = $request->start_date;
        $end_date = $request->end_date;

        if ($start_date && $end_date) {
            $bill_infos = BillInfo::with('order_infos_table', 'table_lists_table', 'cashier_user', 'customer_table', 'waiter_user_table')
                ->whereBetween('date_only', [$start_date, $end_date])
                ->orderBy('id', 'desc')
                ->get();
        }

        return Inertia::render('Cashier/CompletedOrder/Index', [
            'bill_infos' => $bill_infos,
        ]);
    }
}
