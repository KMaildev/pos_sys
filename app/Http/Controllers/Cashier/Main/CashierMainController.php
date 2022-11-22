<?php

namespace App\Http\Controllers\Cashier\Main;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CashierMainController extends Controller
{
    public function index(Request $request)
    {
        return Inertia::render('Cashier/Main/Index');
    }
}
