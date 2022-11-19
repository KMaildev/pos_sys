<?php

namespace App\Http\Controllers;

use App\Models\Department;
use Illuminate\Http\Request;
use Inertia\Inertia;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $department_id = auth()->user()->department_id;
        $departmemt = Department::findOrFail($department_id);
        if ($departmemt->title == 'Waiter') {
            return redirect()->route('pos_table_lists');
        } elseif ($departmemt->title == 'Cashier') {
            return 'Cashier';
        } else {
            return view('home');
        }
    }
}
