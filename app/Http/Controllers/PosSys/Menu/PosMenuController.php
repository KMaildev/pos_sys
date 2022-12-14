<?php

namespace App\Http\Controllers\PosSys\Menu;

use App\Http\Controllers\Controller;
use App\Models\CartTemp;
use App\Models\Category;
use App\Models\MenuList;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PosMenuController extends Controller
{

    public function index(Request $request)
    {
        $type = $request->type ?? 'Beverage';
        $categories = Category::where('type', $type)->get();
        return Inertia::render('Menu/Index', [
            'categories' => $categories,
            'user_name' => auth()->user()->name ?? 0,
        ]);
    }


    public function menuLists(Request $request)
    {
        $categorie_id = $request->categorie_id;
        $menu_lists = MenuList::where('categorie_id', $categorie_id)
            ->get();

        return Inertia::render('Menu/MenuLists', [
            'menu_lists' => $menu_lists,
            'user_name' => auth()->user()->name ?? 0,
        ]);
    }



    public function menuListsSearch(Request $request)
    {
        $search = $request->search;
        $menu_lists = MenuList::query()
            ->where('menu_name', 'LIKE', "%{$search}%")
            ->orWhere('menu_name_mm', 'LIKE', "%{$search}%")
            ->get();
        return Inertia::render('Menu/MenuLists', [
            'menu_lists' => $menu_lists,
            'user_name' => auth()->user()->name ?? 0,
        ]);
    }






    public function index_backup(Request $request, $type = null, $category_id = null)
    {
        $categories = Category::where('type', $type)->get();
        if ($category_id == 'null') {
            $caregory = Category::where('type', $type)->first();
            $category_id = $caregory->id ?? 0;
            $category_title = $caregory->title ?? '';
        } else {
            $category_id = $category_id;
            $caregory = Category::findOrFail($category_id);
            $category_title = $caregory->title;
        }

        $menu_lists = MenuList::with('category_table')
            ->where('categorie_id', $category_id)
            ->get();

        return Inertia::render('Menu/Index', [
            'categories' => $categories,
            'category_title' => $category_title,
            'menu_lists' => $menu_lists,
            'type' => $type,
            'category_id' => $category_id,
            'user_name' => auth()->user()->name ?? 0,
        ]);
    }
}
