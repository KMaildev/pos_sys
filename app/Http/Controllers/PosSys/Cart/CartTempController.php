<?php

namespace App\Http\Controllers\PosSys\Cart;

use App\Http\Controllers\Controller;
use App\Models\CartTemp;
use Illuminate\Http\Request;

class CartTempController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Already Item 
        $already_item = CartTemp::updateOrCreate(
            [
                'menu_list_id' => $request->menu_list_id,
                'session_id' => session()->getId(),
                'user_id' => auth()->user()->id ?? 0,
            ]
        );
        $already_qty = $already_item->qty ?? 0;

        // Update Or Create 
        CartTemp::updateOrCreate(
            [
                'menu_list_id' => $request->menu_list_id,
                'session_id' => session()->getId(),
                'user_id' => auth()->user()->id ?? 0,
            ],
            [
                'menu_list_id' => $request->menu_list_id,
                'qty' => 1,
                'price' => $request->price,
                'remark' => '',
                'session_id' => session()->getId(),
                'user_id' => auth()->user()->id ?? 0,
            ],
        )->increment('qty', $already_qty);

        // return redirect()->back();
        // return json_encode(array(
        //     "statusCode" => 200,
        // ));
    }

    public function clearAll()
    {
        $session_id = session()->getId();
        $user_id = auth()->user()->id ?? 0;
        CartTemp::where('session_id', $session_id)
            ->where('user_id', $user_id)
            ->delete();
        return redirect()->back();
    }


    public function transactionCancel($id)
    {
        $cart_temp = CartTemp::findOrFail($id);
        $cart_temp->delete();
        return redirect()->back();
    }

    public function orderNote(Request $request)
    {
        $cart_temp_id = $request->cart_temp_id;
        $cart_temp = CartTemp::findOrFail($cart_temp_id);
        $cart_temp->remark = $request->remark;
        $cart_temp->update();
        return redirect()->back();
    }

    public function MinusQty(Request $request)
    {
        $cart_temp_id = $request->cart_temp_id;
        $cart_temp = CartTemp::findOrFail($cart_temp_id);
        $min_qty = $cart_temp->qty;
        if ($min_qty == 1) {
            $cart_temp->qty = 1;
        } else {
            $cart_temp->qty = $min_qty - 1;
        }

        $cart_temp->update();
        return redirect()->back();
    }
}
