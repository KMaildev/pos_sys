<?php

namespace App\Http\Controllers\PosSys\TableList;

use App\Http\Controllers\Controller;
use App\Models\Floor;
use App\Models\OrderInfo;
use App\Models\TableList;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class TableListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $floors_categories = Floor::all();

        $floor = Floor::first();
        $floor_id = $request->floor_id ?? $floor->id;

        $table_lists = TableList::with('order_infos_table')
            ->where('floor_id', $floor_id)
            ->get();


        return Inertia::render('TableList/Index', [
            'floors_categories' => $floors_categories,
            'table_lists' => $table_lists,
        ]);
    }

    public function tableTransfer(Request $request)
    {
        // Current Table 
        $id = $request->order_info_id ?? 1;
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table')
            ->findOrFail($id);


        // Floor & Table Lists 
        $floors_categories = Floor::all();
        $floor = Floor::first();
        $floor_id = $request->floor_id ?? $floor->id;

        $table_lists = TableList::with('order_infos_table')
            ->where('floor_id', $floor_id)
            ->get();

        return Inertia::render('Ordered/TableTransfer', [
            'order_infos' => $order_infos,
            'floors_categories' => $floors_categories,
            'table_lists' => $table_lists,
        ]);
    }


    public function confirmTableTransfer(Request $request)
    {
        $order_info_id = $request->order_info_id;
        $table_id = $request->table_id;

        $menu = OrderInfo::findOrFail($order_info_id);
        $menu->table_list_id = $table_id;
        $menu->update();

        return Redirect::route('pos_table_lists');
    }
}
