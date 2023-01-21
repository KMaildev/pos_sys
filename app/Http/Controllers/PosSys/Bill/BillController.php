<?php

namespace App\Http\Controllers\PosSys\Bill;

use App\Http\Controllers\Controller;
use App\Models\Floor;
use App\Models\OrderInfo;
use App\Models\TableList;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BillController extends Controller
{
    public function billTable(Request $request)
    {
        $floors_categories = Floor::all();

        $floor = Floor::first();
        $floor_id = $request->floor_id ?? $floor->id;

        $table_lists = TableList::with('order_infos_table')
            ->where('floor_id', $floor_id)
            ->get();

        return Inertia::render('Bill/TableList', [
            'floors_categories' => $floors_categories,
            'table_lists' => $table_lists,
        ]);
    }
}
