<?php

namespace App\Http\Controllers\PosSys\Ordered;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OrderedController extends Controller
{
    public function orderedDetail($id)
    {
        return Inertia::render('Ordered/OrderedDetail');
    }
}
