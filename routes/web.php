<?php

use App\Http\Controllers\Category\CategoryController;
use App\Http\Controllers\Customer\CustomerController;
use App\Http\Controllers\Floor\FloorController;
use App\Http\Controllers\Hr\DepartmentController;
use App\Http\Controllers\Hr\EmployeeController;
use App\Http\Controllers\Hr\PermissionController;
use App\Http\Controllers\Hr\RoleController;
use App\Http\Controllers\Ingredients\IngredientsController;
use App\Http\Controllers\MenuList\MenuListController;
use App\Http\Controllers\Pos\MenuControlController;
use App\Http\Controllers\PosSys\Menu\PosMenuController;
use App\Http\Controllers\PosSys\TableList\TableListController as TableListTableListController;
use App\Http\Controllers\PosSys\Test\TestController;
use App\Http\Controllers\Table\TableListController;
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
    Route::resource('table_list', TableListController::class);
    Route::resource('customer', CustomerController::class);
    Route::get('table_search_find_by_floor/{floor_id}', [TableListController::class, 'index'])->name('table_search_find_by_floor');
    Route::get('load_table_pos', [TableListController::class, 'loadTablePos'])->name('load_table_pos');
    Route::resource('ingredients', IngredientsController::class);

    // POS 
    Route::get('load_category_and_menu_pos/{type}/{category_id}', [MenuControlController::class, 'loadCategoryAndMenuListPos'])->name('load_category_and_menu_pos');

    // HR 
    Route::resource('employee', EmployeeController::class);
    Route::resource('department', DepartmentController::class);
    Route::resource('permission', PermissionController::class);
    Route::resource('role', RoleController::class);


    // POSSYS
    Route::get('/pos_table_lists', [TableListTableListController::class, 'index'])->name('pos_table_lists');
    Route::get('/pos_menu/{type}/{category_id}', [PosMenuController::class, 'index'])->name('pos_menu');
    Route::get('/pos_test_page', [TestController::class, 'index'])->name('pos_test_page');
});
