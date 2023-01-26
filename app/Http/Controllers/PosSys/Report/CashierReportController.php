<?php

namespace App\Http\Controllers\PosSys\Report;

use App\Http\Controllers\Controller;
use App\Models\BillInfo;
use App\Models\PaymentMethod;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CashierReportController extends Controller
{
    public function CashReport(Request $request)
    {
        $bill_infos = BillInfo::with('payment_method_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $bill_infos = BillInfo::with('payment_method_table')
                ->where('date_only', '>=', request('start_date'))
                ->where('date_only', '<=', request('end_date'))
                ->get();
        }

        return Inertia::render('Report/CashReport', [
            'bill_infos' => $bill_infos,
        ]);
    }



    public function OnlinePay(Request $request)
    {
        $bill_infos = BillInfo::with('payment_method_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $bill_infos = BillInfo::with('payment_method_table')
                ->where('date_only', '>=', request('start_date'))
                ->where('date_only', '<=', request('end_date'))
                ->get();
        }

        return Inertia::render('Report/OnlinePay', [
            'bill_infos' => $bill_infos,
        ]);
    }



    public function BankingReport(Request $request)
    {
        $bill_infos = BillInfo::with('payment_method_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $bill_infos = BillInfo::with('payment_method_table')
                ->where('date_only', '>=', request('start_date'))
                ->where('date_only', '<=', request('end_date'))
                ->get();
        }

        return Inertia::render('Report/BankingReport', [
            'bill_infos' => $bill_infos,
        ]);
    }
}
