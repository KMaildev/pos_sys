<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that's loaded on the first page visit.
     *
     * @see https://inertiajs.com/server-side-setup#root-template
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determines the current asset version.
     *
     * @see https://inertiajs.com/asset-versioning
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    public function version(Request $request): ?string
    {
        return parent::version($request);
    }

    /**
     * Defines the props that are shared by default.
     *
     * @see https://inertiajs.com/shared-data
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function share(Request $request): array
    {
        $department_id  = auth()->user()->department_id ?? '';
        if ($department_id == 1) {
            $department = 'admin';
        } elseif ($department_id == 2) {
            $department = 'manager';
        } elseif ($department_id == 3) {
            $department = 'hr';
        } elseif ($department_id == 4) {
            $department = 'waiter';
        } elseif ($department_id == 5) {
            $department = 'cashier';
        } else {
            $department = 'admin';
        }
        return array_merge(parent::share($request), [
            'user_name' => auth()->user()->name ?? '',
            'login_time' => auth()->user()->last_login_at ?? '',
            'department' => $department,
            // 1 = admin 2 = Manager 3 = HR 4 = Waiter 5 = Cashier

            'success' => session()->has('success') ? session()->get('success') : '',
            'error' => session()->has('error') ? session()->get('error') : '',
        ]);
    }
}
