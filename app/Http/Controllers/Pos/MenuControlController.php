<?php

namespace App\Http\Controllers\Pos;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\MenuList;
use Illuminate\Http\Request;

class MenuControlController extends Controller
{
    public function loadCategoryAndMenuListPos($type, $category_id)
    {
        $categories = Category::where('type', $type)->get();
        if ($category_id == 'null') {
            $caregory = Category::where('type', $type)->first();
            $category_id = $caregory->id;
        } else {
            $category_id = $category_id;
        }
        $menu_lists = MenuList::where('categorie_id', $category_id)->get();

        $viewRender = view('pos.category_menu.category', compact('categories', 'menu_lists'))->render();

        return response()->json([
            'html' => $viewRender,
            'category_id' => $category_id,
        ]);
    }
}
