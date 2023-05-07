<?php

namespace App\Http\Controllers\PosSys\Guest;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Discount;
use App\Models\OrderInfo;
use App\Models\PaymentMethod;
use App\Models\ServiceCharge;
use App\Models\TableList;
use App\Models\Taxrate;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Collection;


class GuestController extends Controller
{
    public function index(Request $request)
    {

        // Order Lists Start
        $start_date = $request->start_date ?? date('Y-m-d');
        $end_date = $request->end_date ?? date('Y-m-d');

        $query = OrderInfo::query();
        // Order Date Search 
        $query->whereBetween('order_date', [$start_date, $end_date]);

        // Table Name Search 
        $query->when(request('table_name'), function ($q) {
            return $q->whereHas('table_lists_table', function($query){
                $query->where('table_name', request('table_name'));
            });
        });

        // Table Name Search 
        $query->when(request('waiter_name'), function ($q) {
            return $q->whereHas('waiter_user_table', function($query){
                $query->where('name', request('waiter_name'));
            });
        });

        $query->with('table_lists_table', 'waiter_user_table', 'order_items_table');
        $order_infos = $query->get();
        // Order Lists End


        $tables = TableList::all();
        $users = User::all();

        return Inertia::render('Guest/Index', [
            'order_infos' => $order_infos,
            'tables' => $tables,
            'users' => $users,
        ]);
    }
}
