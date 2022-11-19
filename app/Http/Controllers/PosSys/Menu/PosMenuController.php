<?php

namespace App\Http\Controllers\PosSys\Menu;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\MenuList;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PosMenuController extends Controller
{
    public function index($type, $category_id)
    {
        $categories = Category::where('type', $type)->get();
        if ($category_id == 'null') {
            $caregory = Category::where('type', $type)->first();
            $category_id = $caregory->id;
        } else {
            $category_id = $category_id;
        }
        $menu_lists = MenuList::where('categorie_id', $category_id)->get();

        return Inertia::render('Menu/Index', [
            'categories' => $categories,
            'menu_lists' => $menu_lists,
        ]);
    }
}
