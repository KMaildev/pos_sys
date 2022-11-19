<?php

namespace App\Http\Controllers\PosSys\Menu;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\MenuList;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PosMenuController extends Controller
{
    public function index($type, $category_id = null)
    {
        $categories = Category::where('type', $type)->get();
        if ($category_id == 'null') {
            $caregory = Category::where('type', $type)->first();
            $category_id = $caregory->id;
            $category_title = $caregory->title;
        } else {
            $category_id = $category_id;
            $caregory = Category::findOrFail($category_id);
            $category_title = $caregory->title;
        }

        $menu_lists = MenuList::query()
            ->where('categorie_id', $category_id)
            ->get();

        return Inertia::render('Menu/Index', [
            'categories' => $categories,
            'category_title' => $category_title,
            'menu_lists' => $menu_lists,
            'type' => $type,
            'category_id' => $category_id,
        ]);
    }
}
