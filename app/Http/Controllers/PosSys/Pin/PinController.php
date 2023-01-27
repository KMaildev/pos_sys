<?php

namespace App\Http\Controllers\PosSys\Pin;

use App\Http\Controllers\Controller;
use App\Models\Department;
use App\Models\LoginLog;
use App\Models\User;
use Carbon\Carbon;
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
            // LoginLog 
            $login_logs = new LoginLog();
            $login_logs->login_time = Carbon::now()->toDateTimeString();
            $login_logs->login_ip = $request->getClientIp();
            $login_logs->device = $request->header('user-agent');
            $login_logs->user_id = $user->id;
            $login_logs->save();

            // Latest Login 
            $latestLogin = User::findOrFail($user->id);
            $latestLogin->last_login_at = date("d/m/Y H:i:s a");
            $latestLogin->last_login_ip = $request->getClientIp();
            $latestLogin->agent = $request->header('user-agent');
            $latestLogin->update();

            $userId = $user->id;
            Auth::loginUsingId($userId);

            $department_id = auth()->user()->department_id;
            $departmemt = Department::findOrFail($department_id);
            return redirect()->route('pos_table_lists');
            // if ($departmemt->title == 'Waiter') {
            //     return redirect()->route('pos_table_lists');
            // } else if ($departmemt->title == 'Cashier') {
            //     return redirect()->route('cashier_main_page');
            // }
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
