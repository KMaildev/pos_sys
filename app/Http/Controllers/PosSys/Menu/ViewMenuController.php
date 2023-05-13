<?php

namespace App\Http\Controllers\PosSys\Menu;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\MenuList;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ViewMenuController extends Controller
{
    public function index(Request $request)
    {
        $type = $request->type ?? 'Beverage';
        $categories = Category::where('type', $type)->get();
        return Inertia::render('ViewMenu/Index', [
            'categories' => $categories,
            'user_name' => auth()->user()->name ?? 0,
        ]);
    }



    public function menuLists(Request $request)
    {
        $categorie_id = $request->categorie_id;
        $menu_lists = MenuList::where('categorie_id', $categorie_id)
            ->get();

        return Inertia::render('ViewMenu/MenuLists', [
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
            ->orWhere('mm_short_menu', 'LIKE', "%{$search}%")
            ->get();
        return Inertia::render('ViewMenu/MenuLists', [
            'menu_lists' => $menu_lists,
            'user_name' => auth()->user()->name ?? 0,
        ]);
    }
}