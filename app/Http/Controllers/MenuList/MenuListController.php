<?php

namespace App\Http\Controllers\MenuList;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreMenuList;
use App\Http\Requests\UpdateMenuList;
use App\Models\Category;
use App\Models\MenuList;
use App\Models\PrintConfig;
use Illuminate\Http\Request;

class MenuListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menu_lists = MenuList::query();
        if (request('q')) {
            $menu_lists->where('menu_name', 'Like', '%' . request('q') . '%');
            $menu_lists->orWhere('menu_name_mm', 'Like', '%' . request('q') . '%');
            $menu_lists->orWhere('price', 'Like', '%' . request('q') . '%');
        }
        $menu_lists = $menu_lists->orderBy('categorie_id', 'ASC')->paginate(20);
        return view('menu_list.index', compact('menu_lists'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::orderBy('type', 'ASC')->get();
        $print_configs = PrintConfig::all();
        return view('menu_list.create', compact('categories', 'print_configs'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreMenuList $request)
    {
        if ($file = $request->hasFile('photo')) {
            $file = $request->file('photo');
            $fileName = $file->getClientOriginalName();
            $destinationPath = public_path() . '/images';
            $file->move($destinationPath, $fileName);
        }

        $menu = new MenuList();
        $menu->menu_name = $request->menu_name;
        $menu->menu_name_mm = $request->menu_name_mm;
        $menu->price = $request->price;
        $menu->categorie_id = $request->categorie_id;

        $category = Category::findOrFail($request->categorie_id);
        $menu->type = $category->type ?? '';

        $print_config = PrintConfig::findOrFail($request->print_config_id);
        $menu->print_config_id = $request->print_config_id;
        $menu->printer_name = $print_config->printer_name ?? '';
        $menu->ip_address = $print_config->ip_address ?? '';


        $mm_short_menu = preg_replace(
            ['/[\p{L}\p{N}@#".]+[\p{L}\p{N}._-]*/u', '/\p{M}/u'],
            ["$0"],
            $request->menu_name_mm
        );
        $menu->mm_short_menu = $mm_short_menu ?? '';
        $menu->photo = $fileName ?? '';
        $menu->save();
        return redirect()->back()->with('success', 'Your processing has been completed.');
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
        $categories = Category::orderBy('type', 'ASC')->get();
        $menu_list = MenuList::findOrFail($id);
        $print_configs = PrintConfig::all();
        return view('menu_list.edit', compact('categories', 'menu_list', 'print_configs'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateMenuList $request, $id)
    {
        if ($file = $request->hasFile('photo')) {
            $file = $request->file('photo');
            $fileName = $file->getClientOriginalName();
            $destinationPath = public_path() . '/images';
            $file->move($destinationPath, $fileName);
        }

        $menu = MenuList::findOrFail($id);
        $menu->menu_name = $request->menu_name;
        $menu->menu_name_mm = $request->menu_name_mm;
        $menu->price = $request->price;
        $menu->categorie_id = $request->categorie_id;
        $category = Category::findOrFail($request->categorie_id);
        $menu->type = $category->type ?? '';

        $print_config = PrintConfig::findOrFail($request->print_config_id);
        $menu->print_config_id = $request->print_config_id;
        $menu->printer_name = $print_config->name ?? '';
        $menu->ip_address = $print_config->ip_address ?? '';

        $mm_short_menu = preg_replace(
            ['/[\p{L}\p{N}@#".]+[\p{L}\p{N}._-]*/u', '/\p{M}/u'],
            ["$0"],
            $request->menu_name_mm
        );
        $menu->mm_short_menu = $mm_short_menu ?? '';
        $menu->photo = $fileName ?? $menu->photo;
        $menu->update();
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
        $menu = MenuList::findOrFail($id);
        $menu->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
