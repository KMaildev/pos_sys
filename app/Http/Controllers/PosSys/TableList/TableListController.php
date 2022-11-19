<?php

namespace App\Http\Controllers\PosSys\TableList;

use App\Http\Controllers\Controller;
use App\Models\Floor;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TableListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $floors_categories = Floor::all();

        $floors = Floor::with('table_lists_table')->get();
        if ($request->table_name) {
            $floors = Floor::with('table_lists_table')
                ->whereRelation('table_lists_table', 'table_name', 'like', "%{$request->table_name}%")
                ->get();
        }

        if ($request->floor_id) {
            $floors = Floor::with('table_lists_table')
                ->where('id', $request->floor_id)
                ->get();
        }

        return Inertia::render('TableList/Index', [
            'floors' => $floors,
            'floors_categories' => $floors_categories,
        ]);
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
        //
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
        //
    }
}
