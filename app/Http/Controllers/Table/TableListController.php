<?php

namespace App\Http\Controllers\Table;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTableList;
use App\Http\Requests\UpdateTableList;
use App\Models\Floor;
use App\Models\TableList;
use Illuminate\Http\Request;

class TableListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $floors = Floor::all();
        $table_lists = TableList::all();

        if ($request->floor_id) {
            $table_lists = TableList::where('floor_id', $request->floor_id)->get();
        }
        return view('table_lists.index', compact('table_lists', 'floors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $floors = Floor::all();
        return view('table_lists.create', compact('floors'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreTableList $request)
    {
        $table_list = new TableList();
        $table_list->floor_id = $request->floor_id;
        $table_list->table_name = $request->table_name;
        $table_list->save();
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
        $table_list = TableList::findOrFail($id);
        $floors = Floor::all();
        return view('table_lists.edit', compact('table_list', 'floors'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateTableList $request, $id)
    {
        $table_list = TableList::findOrFail($id);
        $table_list->floor_id = $request->floor_id;
        $table_list->table_name = $request->table_name;
        $table_list->update();
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
        $table = TableList::findOrFail($id);
        $table->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }


    public function loadTablePos()
    {
        $floors = Floor::with('table_lists_table')->get();
        $viewRender = view('pos.table.index', compact('floors'))->render();
        return response()->json([
            'html' => $viewRender
        ]);
    }
}
