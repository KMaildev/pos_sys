<?php

namespace App\Http\Controllers\PosSys\Report;

use App\Http\Controllers\Controller;
use App\Models\BillInfo;
use App\Models\Customer;
use App\Models\MenuList;
use App\Models\OrderInfo;
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

        $order_items = OrderItem::all();
        return Inertia::render('Report/SalesCategoryAmount', [
            'menu_lists' => $menu_lists,
            'order_items' => $order_items,
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

    public function customerReport(Request $request){
        $keyword = $request->keyword;
        $customers = Customer::with('bill_table')
            ->get();
        if ($keyword) {
            $customers = Customer::with('bill_table')
                ->where('name', 'Like', '%' . $keyword . '%')
                ->orWhere('customer_id', 'Like', '%' . $keyword . '%')
                ->orWhere('primary_number', 'Like', '%' . $keyword . '%')
                ->orWhere('additional_number', 'Like', '%' . $keyword . '%')
                ->orWhere('email', 'Like', '%' . $keyword . '%')
                ->orWhere('address', 'Like', '%' . $keyword . '%')
                ->orWhere('date_of_birth', 'Like', '%' . $keyword . '%')
                ->orWhere('join_date', 'Like', '%' . $keyword . '%')
                ->orWhere('remark', 'Like', '%' . $keyword . '%')
                ->get();
        }
        return Inertia::render('Report/CustomerReport', [
            'customers' => $customers,
        ]);
    }

    public function customerBillHistory($id){

        $bill_infos = BillInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table', 'customer_table', 'order_infos_table')
            ->where('customer_id', $id)
            ->get();
        $customer = Customer::findOrFail($id);
        return Inertia::render('Report/CustomerBillHistory', [
            'bill_infos' => $bill_infos,
            'customer' => $customer,
        ]);
    }
}
