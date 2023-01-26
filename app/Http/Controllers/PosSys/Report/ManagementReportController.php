<?php

namespace App\Http\Controllers\PosSys\Report;

use App\Http\Controllers\Controller;
use App\Models\MenuList;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ManagementReportController extends Controller
{

    public function SalesCategoryAmount(Request $request)
    {
        $menu_lists = MenuList::with('order_items_table', 'category_table')
            ->get();

        if (request('start_date') && request('end_date')) {
            $start_date =  request('start_date');
            $end_date =  request('end_date');
            $menu_lists = MenuList::with(['order_items_table' => function ($query) use ($start_date, $end_date) {
                $query->where('order_date', '>=', $start_date);
                $query->where('order_date', '<=', $end_date);
            }])->with('category_table')
                ->get();
        }

        return Inertia::render('Report/SalesCategoryAmount', [
            'menu_lists' => $menu_lists,
        ]);
    }


    public function SalesCategoryQty(Request $request)
    {

        $menu_lists = MenuList::with('order_items_table', 'category_table')
            ->get();

        $order_item_total = OrderItem::sum('qty');

        if (request('start_date') && request('end_date')) {
            $start_date =  request('start_date');
            $end_date =  request('end_date');
            $menu_lists = MenuList::with(['order_items_table' => function ($query) use ($start_date, $end_date) {
                $query->where('order_date', '>=', $start_date);
                $query->where('order_date', '<=', $end_date);
            }])->with('category_table')
                ->get();

            $order_item_total = OrderItem::where('order_date', '>=', $start_date)
                ->where('order_date', '<=', $end_date)
                ->sum('qty');
        }

        return Inertia::render('Report/SalesCategoryQty', [
            'menu_lists' => $menu_lists,
            'order_item_total' => $order_item_total ?? 0,
        ]);
    }
}
