<?php

namespace App\Http\Controllers\PosSys\Bill;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSubmitPayment;
use App\Models\BillInfo;
use App\Models\Customer;
use App\Models\Discount;
use App\Models\Floor;
use App\Models\OrderInfo;
use App\Models\OrderItem;
use App\Models\PaymentMethod;
use App\Models\PrintBillHistory;
use App\Models\ServiceCharge;
use App\Models\TableList;
use App\Models\Taxrate;
use App\Models\VoidItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class BillController extends Controller
{

    public function billTable(Request $request)
    {
        $floors_categories = Floor::all();

        $floor = Floor::first();
        $floor_id = $request->floor_id ?? $floor->id;

        $table_lists = TableList::with('order_infos_table', 'all_order_infos_table')
            // ->where('floor_id', $floor_id)
            ->get();

        return Inertia::render('Bill/TableList', [
            'floors_categories' => $floors_categories,
            'table_lists' => $table_lists,
        ]);
    }


    public function BillPayment(Request $request, $id)
    {

        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table')
            ->findOrFail($id);

        $order_info_id = $order_infos->id;

        $bill_info = PrintBillHistory::with('payment_method_table')
            ->where('order_info_id', $order_info_id)
            ->latest()
            ->get();

        $void_item_total = VoidItem::where('order_info_id', $order_info_id)
            ->where('manager_status', 'nothing')
            ->count();

        // Customer 
        $custom_search = $request->custom_search;
        $customers = Customer::query();
        if ($custom_search) {
            $customers->where('name', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('customer_id', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('primary_number', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('additional_number', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('email', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('address', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('date_of_birth', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('join_date', 'Like', '%' . $custom_search . '%');
            $customers->orWhere('remark', 'Like', '%' . $custom_search . '%');
        }
        $customers = $customers->get();

        $payment_methods = PaymentMethod::all();
        $taxrates = Taxrate::all();
        $discounts = Discount::all();
        $service_charges = ServiceCharge::all();

        return Inertia::render('Bill/BillPayment', [
            'order_infos' => $order_infos,
            'customers' => $customers,
            'payment_methods' => $payment_methods,
            'taxrates' => $taxrates,
            'discounts' => $discounts,
            'service_charges' => $service_charges,
            'bill_info' => $bill_info,
            'void_item_total' => $void_item_total,
        ]);
    }


    public function submitPayment(StoreSubmitPayment $request)
    {

        $order_info_id = $request->order_info_id;
        $order_info = OrderInfo::findOrFail($order_info_id);

        BillInfo::create([
            'order_info_id' => $order_info_id,
            'customer_id' => $request->customer ?? 0,
            'table_list_id' => $order_info->table_list_id,

            'bill_date_time' => date('Y-m-d h:i:s A'),
            'bill_time' => date('h:i:s A'),
            'payment_type' => $request->payment_method_id,
            'total_amount' => $order_info->total_amount ?? 0,
            'tax_amount' => $request->taxrate ?? 0,
            'discount' => $request->disc ?? 0,
            'discount_amount' => $request->disc_amount ?? 0,

            'service_charges' => $request->service_charge ?? 0,
            'service_charge_amount' => $request->service_charge_amount ?? 0,

            'net_amount' => $request->totalNetAmount ?? 0,
            'received_amount' => $request->received_amount ?? 0,
            'refund_amount' => $request->refund_amount ?? 0,
            'change_amount' => 0,
            'cashier_user_id' => auth()->user()->id ?? 0,
            'waiter_user_id' => $order_info->waiter_user_id,
            'date_only' => date('Y-m-d'),

            'order_no' => $order_info->order_no,
            'inv_no' => $order_info->inv_no,
            'first_table_id' => $order_info->first_table_id,
        ]);

        $order_info->check_out_status = 'paid';
        $order_info->update();
        return Redirect::route('bill_table_lists')->with('success', 'Your processing has been completed.');
    }


    public function CombineBill(Request $request)
    {
        $id = $request->order_info_id;
        $combile_order_infos = OrderInfo::where('id', '!=', $id)
            ->where('check_out_status', NULL)
            ->with('table_lists_table')
            ->get();
        return response()->json(['combile_order_infos' => $combile_order_infos]);
    }


    public function ConfirmCombine(Request $request)
    {
        $main_order_infos = $request->main_order_infos;
        $combile_order_info_id = $request->combile_order_info_id;


        if (empty($combile_order_info_id)) {
            return Redirect::route('bill_table_lists')->with('error', 'Something wrong please try again!');
        } else {
            $guest_no = [];
            foreach ($combile_order_info_id as $key => $value) {
                $combile_order_info_id = $value;

                $combile_order_items = OrderItem::where('order_info_id', $combile_order_info_id)->get();
                foreach ($combile_order_items as $key => $combile_order_item) {
                    $combile_order_item->order_info_id = $main_order_infos;
                    $combile_order_item->update();
                }

                $combile_order_info = OrderInfo::findOrFail($combile_order_info_id);
                $guest_no[] = $combile_order_info->guest_no;

                OrderInfo::findOrFail($combile_order_info_id)->delete();
            }
            $main_order_info_update = OrderInfo::findOrFail($main_order_infos);
            $main_order_info_update->guest_no = $main_order_info_update->guest_no + array_sum($guest_no);
            $main_order_info_update->update();
            Helper::updateOrderInfoTotalAmount($main_order_infos);

            return Redirect::route('bill_table_lists')->with('success', 'Your processing has been completed.');
        }
    }


    public function BillHistory(Request $request, $id)
    {
        $order_info = OrderInfo::with('table_lists_table', 'waiter_user_table', 'order_items_table', 'customer_table')
            ->findOrFail($id);

        // Bill Info 
        $order_info_id = $order_info->id;
        $bill_info = BillInfo::with('payment_method_table')
            ->where('order_info_id', $order_info_id)->first();

        $customer_id = $order_info->customer_id;
        if ($customer_id != 0) {
            $customer = Customer::findOrFail($customer_id);
        }

        return Inertia::render('Bill/BillHistory', [
            'order_info' => $order_info,
            'bill_info' => $bill_info,
            'customer' => $customer ?? '',
        ]);
    }
}
