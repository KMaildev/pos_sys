<?php

namespace App\Http\Controllers\Category;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCategory;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::query();
        if (request('q')) {
            $categories->where('title', 'Like', '%' . request('q') . '%');
            $categories->orWhere('type', 'Like', '%' . request('q') . '%');
        }
        $categories = $categories->orderBy('type', 'ASC')->get();
        return view('category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCategory $request)
    {
        $category = new Category();
        $category->title = $request->title;
        $category->type = $request->type;
        $category->save();
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
        $category = Category::findOrFail($id);
        return view('category.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreCategory $request, $id)
    {
        $category = Category::findOrFail($id);
        $category->title = $request->title;
        $category->type = $request->type;
        $category->update();
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
        $categories = Category::findOrFail($id);
        $categories->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
