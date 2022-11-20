<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Models\OrderInfo;
use Illuminate\Http\Request;

class OrderListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('order.index');
    }

    public function getOrderListAjax(Request $request)
    {
        $keyword = $request->keyword;
        $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'customer_table')
            ->where('check_out_status', NULL)
            ->get();

        if ($keyword) {
            $order_infos = OrderInfo::with('table_lists_table', 'waiter_user_table', 'customer_table')
                ->where('check_out_status', NULL)
                ->whereRelation('table_lists_table', 'table_name', 'like', '%' . $keyword . '%')
                ->get();
        }
        return response()->json([
            'order_infos' => $order_infos
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
