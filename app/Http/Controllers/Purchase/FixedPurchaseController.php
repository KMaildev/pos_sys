<?php

namespace App\Http\Controllers\Purchase;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreFixedPurchase;
use App\Models\FixedAssets;
use App\Models\FixedPurchase;
use App\Models\FixedPurchaseFiles;
use App\Models\FixedPurchaseItem;
use App\Models\Supplier;
use App\Models\TempFixedPurchaseItem;
use App\Models\User;
use Illuminate\Http\Request;

class FixedPurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fixed_purchases = FixedPurchase::query();
        if (request('q')) {
            $fixed_purchases->where('invoice_no', 'Like', '%' . request('q') . '%');
            $fixed_purchases->orWhere('purchase_date', 'Like', '%' . request('q') . '%');
            $fixed_purchases->orWhere('remark', 'Like', '%' . request('q') . '%');
        }
        $fixed_purchases = $fixed_purchases->get();
        return view('purchase.fixed_purchase.index', compact('fixed_purchases'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $fixed_assets = FixedAssets::all();
        $suppliers = Supplier::all();
        $users = User::all();
        return view('purchase.fixed_purchase.create', compact('fixed_assets', 'suppliers', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreFixedPurchase $request)
    {
        $session_id = session()->getId();
        $rowCount = TempFixedPurchaseItem::where('session_id', $session_id)
            ->count();
        if ($rowCount > 0) {
            $purchase_order = new FixedPurchase();
            $purchase_order->supplier_id = $request->supplier_id;
            $purchase_order->invoice_no = $request->invoice_no;
            $purchase_order->purchase_date = $request->purchase_date;
            $purchase_order->remark = $request->remark;
            $purchase_order->total_amount = $request->total_amount;
            $purchase_order->user_id = auth()->user()->id ?? 0;
            $purchase_order->representative_id = $request->representative_id;
            $purchase_order->date_at = date('Y-m-d');
            $purchase_order->save();
            $fixed_purchase_id = $purchase_order->id;

            $temp_fixed_purchase_items = TempFixedPurchaseItem::where('session_id', $session_id)
                ->get();
            foreach ($temp_fixed_purchase_items as $key => $value) {
                $insert[$key]['fixed_asset_id'] = $value['temp_id'];
                $insert[$key]['qty'] = $value['qty'];
                $insert[$key]['cost'] = $value['cost'];
                $insert[$key]['remark'] = $value['remark'];
                $insert[$key]['fixed_purchase_id'] = $fixed_purchase_id;
                $insert[$key]['user_id'] = auth()->user()->id ?? 0;
                $insert[$key]['created_at'] =  date('Y-m-d H:i:s');
                $insert[$key]['updated_at'] =  date('Y-m-d H:i:s');
            }
            FixedPurchaseItem::insert($insert);
            TempFixedPurchaseItem::where('session_id', session()->getId())->delete();



            if ($request->hasFile('attachments')) {
                foreach ($request->file('attachments') as $key => $file) {
                    $path = $file->store('public/attachments');
                    $original_name = $file->getClientOriginalName();

                    $upload[$key]['attachments'] = $path;
                    $upload[$key]['original_name'] = $original_name;
                    $upload[$key]['user_id'] = auth()->user()->id ?? 0;
                    $upload[$key]['fixed_purchase_id'] = $fixed_purchase_id;
                    $upload[$key]['created_at'] =  date('Y-m-d H:i:s');
                    $upload[$key]['updated_at'] =  date('Y-m-d H:i:s');
                }
                FixedPurchaseFiles::insert($upload);
            }

            return redirect()->back()->with('success', 'Your processing has been completed.');
        }
        return redirect()->back()->with('error', 'Something went wrong please try again.');
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
