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
use App\Http\Controllers\Order\OrderListController;
use App\Http\Controllers\Pos\MenuControlController;
use App\Http\Controllers\PosSys\Cart\CartTempController;
use App\Http\Controllers\PosSys\Main\MainController;
use App\Http\Controllers\PosSys\Menu\PosMenuController;
use App\Http\Controllers\PosSys\Order\OrderConfirmController;
use App\Http\Controllers\PosSys\Pin\PinController;
use App\Http\Controllers\PosSys\TableList\TableListController as TableListTableListController;
use App\Http\Controllers\PosSys\Test\TestController;
use App\Http\Controllers\Table\TableListController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;



// PIN Login 
Route::get('/', [PinController::class, 'index'])->name('pin');
Route::post('pin_login', [PinController::class, 'pinLogin'])->name('pin_login');


Route::get('/admin', function () {
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
    Route::resource('order_list', OrderListController::class);
    Route::get('get_order_list_ajax', [OrderListController::class, 'getOrderListAjax'])->name('get_order_list_ajax');


    // HR 
    Route::resource('employee', EmployeeController::class);
    Route::get('show_pin/{id}', [EmployeeController::class, 'showPin'])->name('show_pin');
    Route::post('update_pin', [EmployeeController::class, 'updatePin'])->name('update_pin');
    Route::resource('department', DepartmentController::class);
    Route::resource('permission', PermissionController::class);
    Route::resource('role', RoleController::class);


    // POSSYS
    Route::get('/pos_main_page', [MainController::class, 'index'])->name('pos_main_page');
    Route::get('/pos_table_lists', [TableListTableListController::class, 'index'])->name('pos_table_lists');
    Route::get('/pos_menu/{type}/{category_id}', [PosMenuController::class, 'index'])->name('pos_menu');
    Route::get('/store_cart_temp', [CartTempController::class, 'store'])->name('store_cart_temp');
    Route::get('/clear_all', [CartTempController::class, 'clearAll'])->name('clear_all');
    Route::get('/transaction_cancel/{id}', [CartTempController::class, 'transactionCancel'])->name('transaction_cancel');
    Route::get('/order_note', [CartTempController::class, 'orderNote'])->name('order_note');
    Route::get('/minus_qty', [CartTempController::class, 'MinusQty'])->name('minus_qty');

    Route::get('/order_confirm', [OrderConfirmController::class, 'store'])->name('order_confirm');
    Route::get('/pos_test_page', [TestController::class, 'index'])->name('pos_test_page');

    Route::get('/pos_pin_logout', [PinController::class, 'pinLogout'])->name('pos_pin_logout');


    // POS 
    Route::get('load_category_and_menu_pos/{type}/{category_id}', [MenuControlController::class, 'loadCategoryAndMenuListPos'])->name('load_category_and_menu_pos');
});
