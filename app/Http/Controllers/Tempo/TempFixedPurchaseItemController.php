<?php

namespace App\Http\Controllers\Tempo;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTempFixedPurchaseItem;
use App\Models\TempFixedPurchaseItem;
use Illuminate\Http\Request;

class TempFixedPurchaseItemController extends Controller
{

    public function index(Request $request)
    {
        $session_id = session()->getId();
        $status = $request->status;
        $temp_fixed_purchase_items = TempFixedPurchaseItem::with('fixed_assets_table')
            ->where('session_id', $session_id)
            ->where('status', $status)
            ->get();
        echo json_encode($temp_fixed_purchase_items);
    }


    public function store(StoreTempFixedPurchaseItem $request)
    {
        $temp = new TempFixedPurchaseItem();
        $temp->temp_id = $request->temp_id;
        $temp->temp_name = $request->temp_name;
        $temp->qty = $request->qty;
        $temp->cost = $request->cost;
        $temp->remark = $request->remark ?? '';
        $temp->status = $request->status ?? '';
        $temp->session_id = session()->getId();
        $temp->user_id = auth()->user()->id ?? 0;
        $temp->save();
        return json_encode(array(
            "statusCode" => 200,
        ));
    }

    public function remove($id)
    {
        $temp = TempFixedPurchaseItem::findOrFail($id);
        $temp->delete();
        return json_encode(array(
            "statusCode" => 200,
        ));
    }
}
