<?php

namespace App\Http\Controllers\Purchase;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreVariablePurchase;
use App\Http\Requests\UpdateVariablePurchase;
use App\Models\Supplier;
use App\Models\TempFixedPurchaseItem;
use App\Models\User;
use App\Models\VariableAssets;
use App\Models\VariablePurchase;
use App\Models\VariablePurchaseFiles;
use App\Models\VariablePurchaseItem;
use Illuminate\Http\Request;

class VariablePurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fixed_purchases = VariablePurchase::query();
        if (request('q')) {
            $fixed_purchases->where('invoice_no', 'Like', '%' . request('q') . '%');
            $fixed_purchases->orWhere('purchase_date', 'Like', '%' . request('q') . '%');
            $fixed_purchases->orWhere('remark', 'Like', '%' . request('q') . '%');
        }
        $fixed_purchases = $fixed_purchases->get();
        return view('purchase.variable_purchase.index', compact('fixed_purchases'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $fixed_assets = VariableAssets::all();
        $suppliers = Supplier::all();
        $users = User::all();
        return view('purchase.variable_purchase.create', compact('fixed_assets', 'suppliers', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreVariablePurchase $request)
    {
        $session_id = session()->getId();
        $rowCount = TempFixedPurchaseItem::where('session_id', $session_id)
            ->where('status', 'variable_purchase')
            ->count();
        if ($rowCount > 0) {
            $purchase_order = new VariablePurchase();
            $purchase_order->supplier_id = $request->supplier_id;
            $purchase_order->invoice_no = $request->invoice_no;
            $purchase_order->purchase_date = $request->purchase_date;
            $purchase_order->remark = $request->remark;
            $purchase_order->total_amount = $request->total_amount;
            $purchase_order->user_id = auth()->user()->id ?? 0;
            $purchase_order->representative_id = $request->representative_id;
            $purchase_order->date_at = date('Y-m-d');
            $purchase_order->save();
            $variable_purchase_id = $purchase_order->id;

            $temp_fixed_purchase_items = TempFixedPurchaseItem::where('session_id', $session_id)
                ->where('status', 'variable_purchase')
                ->get();
            foreach ($temp_fixed_purchase_items as $key => $value) {
                $insert[$key]['fixed_asset_id'] = $value['temp_id'];
                $insert[$key]['qty'] = $value['qty'];
                $insert[$key]['cost'] = $value['cost'];
                $insert[$key]['remark'] = $value['remark'];
                $insert[$key]['variable_purchase_id'] = $variable_purchase_id;
                $insert[$key]['user_id'] = auth()->user()->id ?? 0;
                $insert[$key]['created_at'] =  date('Y-m-d H:i:s');
                $insert[$key]['updated_at'] =  date('Y-m-d H:i:s');
            }
            VariablePurchaseItem::insert($insert);
            TempFixedPurchaseItem::where('session_id', session()->getId())->delete();

            if ($request->hasFile('attachments')) {
                foreach ($request->file('attachments') as $key => $file) {
                    $path = $file->store('public/attachments');
                    $original_name = $file->getClientOriginalName();

                    $upload[$key]['attachments'] = $path;
                    $upload[$key]['original_name'] = $original_name;
                    $upload[$key]['user_id'] = auth()->user()->id ?? 0;
                    $upload[$key]['variable_purchase_id'] = $variable_purchase_id;
                    $upload[$key]['created_at'] =  date('Y-m-d H:i:s');
                    $upload[$key]['updated_at'] =  date('Y-m-d H:i:s');
                    $upload[$key]['date_at'] =  date('Y-m-d H:i:s');
                }
                VariablePurchaseFiles::insert($upload);
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
        $fixed_purchase = VariablePurchase::findOrFail($id);
        $fixed_purchase_items = VariablePurchaseItem::where('variable_purchase_id', $id)->get();
        $fixed_purchase_files = VariablePurchaseFiles::where('variable_purchase_id', $id)->get();

        return view('purchase.variable_purchase.show', compact('fixed_purchase', 'fixed_purchase_items', 'fixed_purchase_files'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $fixed_assets = VariableAssets::all();
        $suppliers = Supplier::all();
        $users = User::all();

        $fixed_purchase = VariablePurchase::findOrFail($id);
        $fixed_purchase_items = VariablePurchaseItem::where('variable_purchase_id', $id)->get();
        return view('purchase.variable_purchase.edit', compact('fixed_assets', 'suppliers', 'users', 'fixed_purchase', 'fixed_purchase_items'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateVariablePurchase $request, $id)
    {
        $session_id = session()->getId();
        $rowCount = TempFixedPurchaseItem::where('session_id', $session_id)
            ->where('status', 'variable_purchase')
            ->count();

        $purchase_order = VariablePurchase::findOrFail($id);
        $purchase_order->supplier_id = $request->supplier_id;
        $purchase_order->invoice_no = $request->invoice_no;
        $purchase_order->purchase_date = $request->purchase_date;
        $purchase_order->remark = $request->remark;
        $purchase_order->total_amount = $request->total_amount;
        $purchase_order->user_id = auth()->user()->id ?? 0;
        $purchase_order->representative_id = $request->representative_id;
        $purchase_order->date_at = date('Y-m-d');
        $purchase_order->save();
        $variable_purchase_id = $purchase_order->id;

        if ($rowCount > 0) {
            $temp_fixed_purchase_items = TempFixedPurchaseItem::where('session_id', $session_id)
                ->where('status', 'variable_purchase')
                ->get();
            foreach ($temp_fixed_purchase_items as $key => $value) {
                $insert[$key]['fixed_asset_id'] = $value['temp_id'];
                $insert[$key]['qty'] = $value['qty'];
                $insert[$key]['cost'] = $value['cost'];
                $insert[$key]['remark'] = $value['remark'];
                $insert[$key]['variable_purchase_id'] = $variable_purchase_id;
                $insert[$key]['user_id'] = auth()->user()->id ?? 0;
                $insert[$key]['created_at'] =  date('Y-m-d H:i:s');
                $insert[$key]['updated_at'] =  date('Y-m-d H:i:s');
            }
            VariablePurchaseItem::insert($insert);
            TempFixedPurchaseItem::where('session_id', session()->getId())->delete();
        }

        if ($request->hasFile('attachments')) {
            foreach ($request->file('attachments') as $key => $file) {
                $path = $file->store('public/attachments');
                $original_name = $file->getClientOriginalName();

                $upload[$key]['attachments'] = $path;
                $upload[$key]['original_name'] = $original_name;
                $upload[$key]['user_id'] = auth()->user()->id ?? 0;
                $upload[$key]['variable_purchase_id'] = $variable_purchase_id;
                $upload[$key]['created_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['updated_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['date_at'] =  date('Y-m-d H:i:s');
            }
            VariablePurchaseFiles::insert($upload);
        }

        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $fixed_purchase = VariablePurchase::findOrFail($id);
        $fixed_purchase->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }


    public function attachmentFiles($id)
    {
        $fixed_purchase = VariablePurchase::findOrFail($id);
        $fixed_purchase_files = VariablePurchaseFiles::where('variable_purchase_id', $id)->get();
        return view('purchase.variable_purchase.attachment_files', compact('fixed_purchase', 'fixed_purchase_files'));
    }

    public function attachmentFilesDelete($id)
    {
        $fixed_purchase = VariablePurchaseFiles::findOrFail($id);
        $fixed_purchase->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
