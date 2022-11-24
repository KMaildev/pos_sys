<?php

namespace App\Http\Controllers\Cashier\Main;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\MenuList;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class CashierMainController extends Controller
{
    public function index(Request $request)
    {
        $total_price = OrderItem::sum(DB::raw('price * qty'));
        $total_customers = Customer::count();
        $total_order_infos = OrderInfo::count();
        $total_menu_lists = MenuList::count();


        // Orde Item
        $order_items = OrderItem::select(DB::raw("SUM(price) as count"), DB::raw("MONTHNAME(created_at) as month_name"))
            ->whereYear('created_at', date('Y'))
            ->groupBy(DB::raw("month_name"))
            ->orderBy('id', 'ASC')
            ->pluck('count', 'month_name');

        $order_items_labels = $order_items->keys();
        $order_items_data = $order_items->values();

        return Inertia::render('Cashier/Main/Index', [
            'total_price' => $total_price,
            'total_customers' => $total_customers,
            'total_order_infos' => $total_order_infos,
            'total_menu_lists' => $total_menu_lists,
            'order_items_labels' => $order_items_labels,
            'order_items_data' => $order_items_data,
        ]);
    }
}
