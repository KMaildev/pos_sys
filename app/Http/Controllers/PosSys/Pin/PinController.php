<?php

namespace App\Http\Controllers\PosSys\Pin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PinController extends Controller
{
    public function index()
    {
        return view('auth.pin.index');
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
            return redirect()->route('pos_table_lists');
        } else {
            return redirect()->back()->with('error', 'PIN Code is not valid');
        }
    }
}
