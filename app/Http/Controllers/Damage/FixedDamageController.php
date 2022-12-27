<?php

namespace App\Http\Controllers\Damage;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreFixedDamage;
use App\Http\Requests\UpdateFixedDemage;
use App\Models\FixedAssets;
use App\Models\FixedDamage;
use App\Models\FixedDamangeFile;
use App\Models\FixedPurchase;
use Illuminate\Http\Request;

class FixedDamageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fixed_damages = FixedDamage::query();
        if (request('q')) {
            $fixed_damages->where('causes_of_accidents', 'Like', '%' . request('q') . '%');
            $fixed_damages->orWhere('compensation', 'Like', '%' . request('q') . '%');
            $fixed_damages->orWhere('remark', 'Like', '%' . request('q') . '%');
        }
        $fixed_damages = $fixed_damages->get();
        return view('damage.fixed_damage.index', compact('fixed_damages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $fixed_assets = FixedAssets::all();
        return view('damage.fixed_damage.create', compact('fixed_assets'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreFixedDamage $request)
    {

        if ($request->hasFile('voucher_attach')) {
            $voucher_attach = $request->file('voucher_attach');
            $voucher_attach = $voucher_attach->store('public/voucher_attach');
        }
        $store = new FixedDamage();
        $store->fixed_asset_id = $request->fixed_asset_id;
        $store->damage_qty = $request->damage_qty;
        $store->causes_of_accidents = $request->causes_of_accidents;
        $store->compensation = $request->compensation;
        $store->remark = $request->remark;
        $store->date_at = date('Y-m-d');
        $store->user_id = auth()->user()->id ?? 0;
        $store->voucher_attach = $voucher_attach ?? '';
        $store->damage_date = $request->damage_date;
        $store->save();
        $fixed_damage_id = $store->id;

        if ($request->hasFile('proof_photo')) {
            foreach ($request->file('proof_photo') as $key => $file) {
                $path = $file->store('public/proof_photo');
                $original_name = $file->getClientOriginalName();

                $upload[$key]['attachments'] = $path;
                $upload[$key]['original_name'] = $original_name;
                $upload[$key]['user_id'] = auth()->user()->id ?? 0;
                $upload[$key]['fixed_damage_id'] = $fixed_damage_id;
                $upload[$key]['created_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['updated_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['date_at'] =  date('Y-m-d H:i:s');
            }
            FixedDamangeFile::insert($upload);
        }

        return redirect()->back()->with('success', 'Successfully Processed!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $fixed_assets = FixedAssets::all();
        $fixed_damage = FixedDamage::findOrFail($id);
        return view('damage.fixed_damage.show', compact('fixed_assets', 'fixed_damage'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $fixed_assets = FixedAssets::all();
        $fixed_damage = FixedDamage::findOrFail($id);
        return view('damage.fixed_damage.edit', compact('fixed_assets', 'fixed_damage'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateFixedDemage $request, $id)
    {
        if ($request->hasFile('voucher_attach')) {
            $voucher_attach = $request->file('voucher_attach');
            $voucher_attach = $voucher_attach->store('public/voucher_attach');
        }
        $store = FixedDamage::findOrFail($id);
        $store->fixed_asset_id = $request->fixed_asset_id;
        $store->damage_qty = $request->damage_qty;
        $store->causes_of_accidents = $request->causes_of_accidents;
        $store->compensation = $request->compensation;
        $store->remark = $request->remark;
        $store->date_at = date('Y-m-d');
        $store->user_id = auth()->user()->id ?? 0;
        $store->voucher_attach = $voucher_attach ?? $store->voucher_attach;
        $store->damage_date = $request->damage_date;
        $store->update();
        $fixed_damage_id = $store->id;

        if ($request->hasFile('proof_photo')) {
            foreach ($request->file('proof_photo') as $key => $file) {
                $path = $file->store('public/proof_photo');
                $original_name = $file->getClientOriginalName();

                $upload[$key]['attachments'] = $path;
                $upload[$key]['original_name'] = $original_name;
                $upload[$key]['user_id'] = auth()->user()->id ?? 0;
                $upload[$key]['fixed_damage_id'] = $fixed_damage_id;
                $upload[$key]['created_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['updated_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['date_at'] =  date('Y-m-d H:i:s');
            }
            FixedDamangeFile::insert($upload);
        }

        return redirect()->back()->with('success', 'Successfully Processed!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $delete = FixedDamage::findOrFail($id);
        $delete->delete();
        return redirect()->back()->with('success', 'Successfully Processed!');
    }
}
