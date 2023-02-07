<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreDamage;
use App\Http\Requests\UpdateDamage;
use App\Models\Damage;
use App\Models\DamageFiles;
use App\Models\Ingredients;
use App\Models\Store;
use Illuminate\Http\Request;

class DamageController extends Controller
{
    public function index(Request $request)
    {
        $damages = Damage::all();
        return view('stock_damage.index', compact('damages'));
    }

    public function create(Request $request)
    {
        $ingredients = Ingredients::all();
        $stores = Store::all();
        return view('stock_damage.create', compact('ingredients', 'stores'));
    }

    public function store(StoreDamage $request)
    {
        $stock_opening = new Damage();
        $stock_opening->ingredient_id = $request->ingredient_id;
        $stock_opening->damage_date = $request->damage_date;
        $stock_opening->damage_unit = $request->damage_unit;
        $stock_opening->cause_of_damage = $request->cause_of_damage;
        $stock_opening->store_id = $request->store_id;
        $stock_opening->user_id = auth()->user()->id ?? 0;
        $stock_opening->save();
        $damage_id = $stock_opening->id;

        if ($request->hasFile('damage_files')) {
            foreach ($request->file('damage_files') as $key => $file) {
                $path = $file->store('public/damage_files');
                $original_name = $file->getClientOriginalName();

                $insert[$key]['damage_id'] = $damage_id;
                $insert[$key]['files'] = $path;
                $insert[$key]['original_name'] = $original_name;
                $insert[$key]['user_id'] = auth()->user()->id ?? 0;
                $insert[$key]['created_at'] =  date('Y-m-d H:i:s');
                $insert[$key]['updated_at'] =  date('Y-m-d H:i:s');
            }
            DamageFiles::insert($insert);
        }

        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    public function edit($id)
    {
        $ingredients = Ingredients::all();
        $stores = Store::all();
        $stock_transfer = Damage::findOrFail($id);
        return view('stock_damage.edit', compact('ingredients', 'stores', 'stock_transfer'));
    }

    public function update(UpdateDamage $request, $id)
    {
        $stock_opening = Damage::findOrFail($id);
        $stock_opening->ingredient_id = $request->ingredient_id;
        $stock_opening->damage_date = $request->damage_date;
        $stock_opening->damage_unit = $request->damage_unit;
        $stock_opening->cause_of_damage = $request->cause_of_damage;
        $stock_opening->store_id = $request->store_id;
        $stock_opening->user_id = auth()->user()->id ?? 0;
        $stock_opening->update();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    public function destroy($id)
    {
        $floor = Damage::findOrFail($id);
        $floor->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    public function damageMediaFile($id)
    {
        $damage = Damage::findOrFail($id);
        $damage_files = DamageFiles::where('damage_id', $id)
            ->get();
        return view('stock_damage.stock_damage_media_file', compact('damage', 'damage_files'));
    }

    public function damageFilesUpload(Request $request)
    {
        $damage_id = $request->damage_id;
        if ($request->hasFile('damage_files')) {
            foreach ($request->file('damage_files') as $key => $file) {
                $path = $file->store('public/damage_files');
                $original_name = $file->getClientOriginalName();

                $insert[$key]['damage_id'] = $damage_id;
                $insert[$key]['files'] = $path;
                $insert[$key]['original_name'] = $original_name;
                $insert[$key]['user_id'] = auth()->user()->id ?? 0;
                $insert[$key]['created_at'] =  date('Y-m-d H:i:s');
                $insert[$key]['updated_at'] =  date('Y-m-d H:i:s');
            }
            DamageFiles::insert($insert);
        }
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
