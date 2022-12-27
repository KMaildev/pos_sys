<?php

namespace App\Http\Controllers\Damage;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreVariableDamage;
use App\Http\Requests\UpdateVariableDamage;
use App\Models\VariableAssets;
use App\Models\VariableDamage;
use App\Models\VariableDamangeFile;
use Illuminate\Http\Request;

class VariableDamageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $variable_damages = VariableDamage::query();
        if (request('q')) {
            $variable_damages->where('causes_of_accidents', 'Like', '%' . request('q') . '%');
            $variable_damages->orWhere('compensation', 'Like', '%' . request('q') . '%');
            $variable_damages->orWhere('remark', 'Like', '%' . request('q') . '%');
        }
        $variable_damages = $variable_damages->get();
        return view('damage.variable_damage.index', compact('variable_damages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $variable_assets = VariableAssets::all();
        return view('damage.variable_damage.create', compact('variable_assets'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreVariableDamage $request)
    {

        if ($request->hasFile('voucher_attach')) {
            $voucher_attach = $request->file('voucher_attach');
            $voucher_attach = $voucher_attach->store('public/voucher_attach');
        }
        $store = new VariableDamage();
        $store->variable_asset_id = $request->variable_asset_id;
        $store->damage_qty = $request->damage_qty;
        $store->causes_of_accidents = $request->causes_of_accidents;
        $store->compensation = $request->compensation;
        $store->remark = $request->remark;
        $store->date_at = date('Y-m-d');
        $store->user_id = auth()->user()->id ?? 0;
        $store->voucher_attach = $voucher_attach ?? '';
        $store->damage_date = $request->damage_date;
        $store->save();
        $variable_damage_id = $store->id;

        if ($request->hasFile('proof_photo')) {
            foreach ($request->file('proof_photo') as $key => $file) {
                $path = $file->store('public/proof_photo');
                $original_name = $file->getClientOriginalName();

                $upload[$key]['attachments'] = $path;
                $upload[$key]['original_name'] = $original_name;
                $upload[$key]['user_id'] = auth()->user()->id ?? 0;
                $upload[$key]['variable_damage_id'] = $variable_damage_id;
                $upload[$key]['created_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['updated_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['date_at'] =  date('Y-m-d H:i:s');
            }
            VariableDamangeFile::insert($upload);
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
        $variable_damage = VariableDamage::findOrFail($id);
        $variable_damange_files = VariableDamangeFile::where('variable_damage_id', $id)
            ->get();
        return view('damage.variable_damage.show', compact('variable_damange_files', 'variable_damage'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $variable_assets = VariableAssets::all();
        $variable_damage = VariableDamage::findOrFail($id);
        return view('damage.variable_damage.edit', compact('variable_assets', 'variable_damage'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateVariableDamage $request, $id)
    {
        if ($request->hasFile('voucher_attach')) {
            $voucher_attach = $request->file('voucher_attach');
            $voucher_attach = $voucher_attach->store('public/voucher_attach');
        }
        $store = VariableDamage::findOrFail($id);
        $store->variable_asset_id = $request->variable_asset_id;
        $store->damage_qty = $request->damage_qty;
        $store->causes_of_accidents = $request->causes_of_accidents;
        $store->compensation = $request->compensation;
        $store->remark = $request->remark;
        $store->date_at = date('Y-m-d');
        $store->user_id = auth()->user()->id ?? 0;
        $store->voucher_attach = $voucher_attach ?? $store->voucher_attach;
        $store->damage_date = $request->damage_date;
        $store->update();
        $variable_damage_id = $store->id;

        if ($request->hasFile('proof_photo')) {
            foreach ($request->file('proof_photo') as $key => $file) {
                $path = $file->store('public/proof_photo');
                $original_name = $file->getClientOriginalName();

                $upload[$key]['attachments'] = $path;
                $upload[$key]['original_name'] = $original_name;
                $upload[$key]['user_id'] = auth()->user()->id ?? 0;
                $upload[$key]['variable_damage_id'] = $variable_damage_id;
                $upload[$key]['created_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['updated_at'] =  date('Y-m-d H:i:s');
                $upload[$key]['date_at'] =  date('Y-m-d H:i:s');
            }
            VariableDamangeFile::insert($upload);
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
        $delete = VariableDamage::findOrFail($id);
        $delete->delete();
        return redirect()->back()->with('success', 'Successfully Processed!');
    }
}
