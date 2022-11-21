<?php

namespace App\Http\Controllers\PosSys\Pin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class PinController extends Controller
{
    public function index()
    {
        return view('auth.pin.index');
        // return Inertia::render('Pin/PinLogin');
    }


    public function pinLogin(Request $request)
    {
        $pin_code = $request->pin_code;
        $request->validate([
            'pin_code' => 'required',
        ]);

        $user = User::where('pin_code', $pin_code)->first();
        if ($user) {
            $userId = $user->id;
            Auth::loginUsingId($userId);
            return redirect()->route('pos_main_page');
        } else {
            return redirect()->back()->with('error', 'PIN Code is not valid');
        }
    }

    public function pinLogout()
    {
        Auth::logout();
        return redirect()->route('pin');
    }
}
