<?php

namespace App\Http\Controllers\Ingredients;

use App\Http\Controllers\Controller;
use App\Models\IngredientList;
use Illuminate\Http\Request;

class IngredientListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $menu_list_id = $request->menu_list_id;
        $ingredient_lists = IngredientList::where('menu_list_id', $menu_list_id)
            ->get();
        echo json_encode($ingredient_lists);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $temp = new IngredientList();
        $temp->ingredient_id = $request->ingredient_id;
        $temp->menu_list_id = $request->menu_list_id;
        $temp->ingredient_name = $request->ingredient_name;
        $temp->gram_to_kg = $request->gram_to_kg;
        $temp->unit = $request->unit;
        $temp->qty = $request->qty;
        $temp->one_kg_price = $request->one_kg_price ?? '';
        $temp->price_kg = $request->price_kg ?? '';
        $temp->total_amount = $request->total_amount ?? '';
        $temp->one_kg_per_price = $request->one_kg_per_price ?? '';
        $temp->user_id = auth()->user()->id ?? 0;
        $temp->save();
        return json_encode(array(
            "statusCode" => 200,
        ));
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $temp = IngredientList::findOrFail($id);
        $temp->delete();
        return json_encode(array(
            "statusCode" => 200,
        ));
    }
}
