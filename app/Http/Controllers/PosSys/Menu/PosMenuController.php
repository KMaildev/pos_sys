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
    public function index(Request $request, $type = null, $category_id = null)
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


        // Cart Temp 
        $session_id = session()->getId();
        $user_id = auth()->user()->id ?? 0;
        $cart_temps = CartTemp::with('menu_lists_table')
            ->where('session_id', $session_id)
            ->where('user_id', $user_id)
            ->get();

        return Inertia::render('Menu/Index', [
            'categories' => $categories,
            'category_title' => $category_title,
            'menu_lists' => $menu_lists,
            'cart_temps' => $cart_temps,
            'type' => $type,
            'category_id' => $category_id,
            'user_name' => auth()->user()->name ?? 0,
        ]);
    }
}
