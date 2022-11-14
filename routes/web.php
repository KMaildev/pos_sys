<?php

use App\Http\Controllers\Category\CategoryController;
use App\Http\Controllers\Floor\FloorController;
use App\Http\Controllers\Hr\DepartmentController;
use App\Http\Controllers\Hr\EmployeeController;
use App\Http\Controllers\Hr\PermissionController;
use App\Http\Controllers\Hr\RoleController;
use App\Http\Controllers\MenuList\MenuListController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('auth.login');
});
Auth::routes(['register' => false]);

Route::middleware('auth')->group(function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::resource('category', CategoryController::class);
    Route::resource('menu_list', MenuListController::class);
    Route::resource('floor', FloorController::class);
    // HR 
    Route::resource('employee', EmployeeController::class);
    Route::resource('department', DepartmentController::class);
    Route::resource('permission', PermissionController::class);
    Route::resource('role', RoleController::class);
});
