<?php

use App\Http\Controllers\Cashier\CompletedOrder\CashierCompletedOrderController;
use App\Http\Controllers\Cashier\Customer\CashierCustomerController;
use App\Http\Controllers\Cashier\Main\CashierMainController;
use App\Http\Controllers\Cashier\Order\CashierOrderController;
use App\Http\Controllers\Category\CategoryController;
use App\Http\Controllers\Customer\CustomerController;
use App\Http\Controllers\Damage\FixedDamageController;
use App\Http\Controllers\Damage\VariableDamageController;
use App\Http\Controllers\Floor\FloorController;
use App\Http\Controllers\Hr\DepartmentController;
use App\Http\Controllers\Hr\EmployeeController;
use App\Http\Controllers\Hr\PermissionController;
use App\Http\Controllers\Hr\RoleController;
use App\Http\Controllers\Ingredients\IngredientListController;
use App\Http\Controllers\Ingredients\IngredientsController;
use App\Http\Controllers\Inventory\CurrentStockSituationControllers;
use App\Http\Controllers\Inventory\DamageController;
use App\Http\Controllers\Inventory\FixedAssetsController;
use App\Http\Controllers\Inventory\StockInController;
use App\Http\Controllers\Inventory\StockLedgerController;
use App\Http\Controllers\Inventory\StockOpeningController;
use App\Http\Controllers\Inventory\StockOutController;
use App\Http\Controllers\Inventory\StockTransferController;
use App\Http\Controllers\Inventory\StoreTypeController;
use App\Http\Controllers\Inventory\VariableAssetsController;
use App\Http\Controllers\MenuList\MenuListController;
use App\Http\Controllers\Notice\NoticeBoardController;
use App\Http\Controllers\Order\OrderListController;
use App\Http\Controllers\Pos\MenuControlController;
use App\Http\Controllers\PosSys\Bill\BillController;
use App\Http\Controllers\PosSys\Cart\CartTempController;
use App\Http\Controllers\PosSys\Guest\GuestController;
use App\Http\Controllers\PosSys\Main\MainController;
use App\Http\Controllers\PosSys\Menu\PosMenuController;
use App\Http\Controllers\PosSys\Menu\ViewMenuController;
use App\Http\Controllers\PosSys\Order\OrderConfirmController;
use App\Http\Controllers\PosSys\Ordered\OrderedController;
use App\Http\Controllers\PosSys\Pin\PinController;
use App\Http\Controllers\PosSys\Report\CashierReportController;
use App\Http\Controllers\PosSys\Report\ManagementReportController;
use App\Http\Controllers\PosSys\Report\SaleReportController;
use App\Http\Controllers\PosSys\Split\SplitBillController;
use App\Http\Controllers\PosSys\TableList\TableListController as TableListTableListController;
use App\Http\Controllers\PosSys\Test\TestController;
use App\Http\Controllers\PosSys\Void\VoidController;
use App\Http\Controllers\Purchase\FixedPurchaseController;
use App\Http\Controllers\Purchase\FixedPurchaseItemController;
use App\Http\Controllers\Purchase\VariablePurchaseController;
use App\Http\Controllers\Purchase\VariablePurchaseItemController;
use App\Http\Controllers\Supplier\SupplierController;
use App\Http\Controllers\System\DiscountController;
use App\Http\Controllers\System\PaymentMethodController;
use App\Http\Controllers\System\ServiceChargesController;
use App\Http\Controllers\System\StoreController;
use App\Http\Controllers\System\TaxrateController;
use App\Http\Controllers\Table\TableListController;
use App\Http\Controllers\Tempo\TempFixedPurchaseItemController;
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

    Route::resource('notice', NoticeBoardController::class);
    Route::resource('category', CategoryController::class);
    Route::resource('menu_list', MenuListController::class);

    Route::resource('floor', FloorController::class);
    Route::resource('table_list', TableListController::class);
    Route::resource('customer', CustomerController::class);

    Route::resource('supplier', SupplierController::class);
    Route::get('get_supplier_by_id/{id}', [SupplierController::class, 'getSupplierById'])->name('get_supplier_by_id');


    Route::get('table_search_find_by_floor/{floor_id}', [TableListController::class, 'index'])->name('table_search_find_by_floor');
    Route::get('load_table_pos', [TableListController::class, 'loadTablePos'])->name('load_table_pos');
    Route::resource('ingredients', IngredientsController::class);
    Route::get('add_ingredients/{id}', [IngredientsController::class, 'addIngredients'])->name('add_ingredients');
    Route::get('ingredients_by_id/{id}', [IngredientsController::class, 'ingredientsByIdJson'])->name('ingredients_by_id');

    Route::resource('ingredient_list', IngredientListController::class);
    Route::get('get_ingredient_list', [IngredientListController::class, 'index'])->name('get_ingredient_list');
    Route::post('store_ingredient_list', [IngredientListController::class, 'store'])->name('store_ingredient_list');
    Route::get('remove_ingredient_list/{id}', [IngredientListController::class, 'destroy'])->name('remove_ingredient_list');

    Route::resource('order_list', OrderListController::class);
    Route::get('get_order_list_ajax', [OrderListController::class, 'getOrderListAjax'])->name('get_order_list_ajax');


    // HR 
    Route::resource('employee', EmployeeController::class);
    Route::get('show_pin/{id}', [EmployeeController::class, 'showPin'])->name('show_pin');
    Route::post('update_pin', [EmployeeController::class, 'updatePin'])->name('update_pin');
    Route::resource('department', DepartmentController::class);
    Route::resource('permission', PermissionController::class);
    Route::resource('role', RoleController::class);

    // Inventory 
    Route::resource('stock_opening', StockOpeningController::class);
    Route::post('stock_opening_entry', [StockOpeningController::class, 'store'])->name('stock_opening_entry');
    Route::get('get_stock_opening_entry', [StockOpeningController::class, 'openingStockEntryAjax'])->name('get_stock_opening_entry');
    Route::get('confirm_stock_opening_entry', [StockOpeningController::class, 'confirmOpeningStock'])->name('confirm_stock_opening_entry');
    Route::get('remove_stock_openings/{id}', [StockOpeningController::class, 'removeStockOpenings'])->name('remove_stock_openings');

    // Stock In 
    Route::resource('stock_in', StockInController::class);
    Route::post('stock_in_entry', [StockInController::class, 'store'])->name('stock_in_entry');
    Route::get('get_stock_in_entry', [StockInController::class, 'stockInEntryAjax'])->name('get_stock_in_entry');
    Route::get('confirm_stock_in_entry', [StockInController::class, 'confirmStockIn'])->name('confirm_stock_in_entry');
    Route::get('remove_stock_in/{id}', [StockInController::class, 'removeStockIn'])->name('remove_stock_in');

    // Stock Transfer
    Route::resource('stock_transfer', StockTransferController::class);
    Route::resource('stock_damage', DamageController::class);
    Route::get('stock_damage_media_file/{id}', [DamageController::class, 'damageMediaFile'])->name('stock_damage_media_file');
    Route::post('damage_files_upload', [DamageController::class, 'damageFilesUpload'])->name('damage_files_upload');

    Route::resource('stock_out', StockOutController::class);
    Route::resource('current_stock_situation', CurrentStockSituationControllers::class);
    Route::resource('stock_ledger', StockLedgerController::class);

    // System 
    Route::resource('store', StoreController::class);
    Route::resource('store_type', StoreTypeController::class);
    Route::resource('taxrate', TaxrateController::class);
    Route::resource('discount', DiscountController::class);
    Route::resource('service_charge', ServiceChargesController::class);
    Route::resource('payment_method', PaymentMethodController::class);

    // POSSYS
    Route::get('/pos_main_page', [MainController::class, 'index'])->name('pos_main_page');
    Route::get('/pos_table_lists', [TableListTableListController::class, 'index'])->name('pos_table_lists');
    Route::get('/table_transfer', [TableListTableListController::class, 'tableTransfer'])->name('table_transfer');
    Route::get('/confirm_table_transfer', [TableListTableListController::class, 'confirmTableTransfer'])->name('confirm_table_transfer');

    Route::get('/pos_menu', [PosMenuController::class, 'index'])->name('pos_menu');
    Route::get('/pos_menu_lists', [PosMenuController::class, 'menuLists'])->name('pos_menu_lists');
    Route::get('/pos_menu_lists_search', [PosMenuController::class, 'menuListsSearch'])->name('pos_menu_lists_search');

    Route::post('/order_confirm', [OrderConfirmController::class, 'store'])->name('order_confirm');
    Route::get('/pos_test_page', [TestController::class, 'index'])->name('pos_test_page');
    Route::get('/pos_pin_logout', [PinController::class, 'pinLogout'])->name('pos_pin_logout');

    Route::get('/pos_guest_index', [GuestController::class, 'index'])->name('pos_guest_index');
   

    Route::get('/ordered_detail/{id}', [OrderedController::class, 'orderedDetail'])->name('ordered_detail');
    Route::get('/pos_split_bill/{id}', [SplitBillController::class, 'SplitBill'])->name('pos_split_bill');
    Route::get('/split_qty_update', [SplitBillController::class, 'SplitQtyUpdate'])->name('split_qty_update');
    Route::get('/split_order_confirm', [SplitBillController::class, 'SplitOrderConfirm'])->name('split_order_confirm');
    Route::get('/choose_order_infos', [TableListTableListController::class, 'chooseOrderInfos'])->name('choose_order_infos');
    Route::get('/pos_void_order/{id}', [VoidController::class, 'VoidOrder'])->name('pos_void_order');
    Route::get('/pos_void_item', [VoidController::class, 'VoidItem'])->name('pos_void_item');
    Route::get('/confirm_void_item', [VoidController::class, 'ConfirmVoidItem'])->name('confirm_void_item');
    
    Route::get('/manager_void_item', [VoidController::class, 'getManagerVoidItems'])->name('manager_void_item');
    Route::get('/manager_void_item_accept', [VoidController::class, 'managerVoidItemsAccept'])->name('manager_void_item_accept');
    Route::get('/manager_void_item_reject', [VoidController::class, 'managerVoidItemsReject'])->name('manager_void_item_reject');
    Route::get('/pos_void_item_count', [VoidController::class, 'voidItemCount'])->name('pos_void_item_count');

    Route::get('/view_pos_menu', [ViewMenuController::class, 'index'])->name('view_pos_menu');
    Route::get('/view_pos_menu_lists', [ViewMenuController::class, 'menuLists'])->name('view_pos_menu_lists');
    Route::get('/view_menu_lists_search', [ViewMenuController::class, 'menuListsSearch'])->name('view_menu_lists_search');
   
    // BILL 
    Route::get('/bill_table_lists', [BillController::class, 'billTable'])->name('bill_table_lists');
    Route::get('/bill_payment/{id}', [BillController::class, 'BillPayment'])->name('bill_payment');
    Route::post('/pos_submit_payment', [BillController::class, 'submitPayment'])->name('pos_submit_payment');
    Route::get('/bill_history/{id}', [BillController::class, 'BillHistory'])->name('bill_history');
    
    Route::get('/pos_combine_bill', [BillController::class, 'CombineBill'])->name('pos_combine_bill');
    Route::post('/pos_confirm_combine', [BillController::class, 'ConfirmCombine'])->name('pos_confirm_combine');

    // Customer Group 
    Route::get('/cashier_customer', [CashierCustomerController::class, 'index'])->name('cashier_customer');
    Route::get('/cashier_customer_create', [CashierCustomerController::class, 'create'])->name('cashier_customer_create');
    Route::post('/cashier_customer_store', [CashierCustomerController::class, 'store'])->name('cashier_customer_store');
    Route::get('/cashier_customer_edit/{customer}/edit', [CashierCustomerController::class, 'edit'])->name('cashier_customer_edit');
    Route::put('/cashier_customer_update/{id}', [CashierCustomerController::class, 'update'])->name('cashier_customer_update');

    // Report 
    Route::get('/pos_sale_report', [SaleReportController::class, 'SaleReport'])->name('pos_sale_report');
    Route::get('/pos_staff_sales', [SaleReportController::class, 'StaffSales'])->name('pos_staff_sales');
    Route::get('/pos_tables_sales', [SaleReportController::class, 'TablesSales'])->name('pos_tables_sales');
    Route::get('/pos_payment_types_report', [SaleReportController::class, 'PaymentTypesReport'])->name('pos_payment_types_report');
    Route::get('/pos_discount_report', [SaleReportController::class, 'DiscountReport'])->name('pos_discount_report');
    Route::get('/pos_amp_report', [SaleReportController::class, 'DiscountAMPReport'])->name('pos_amp_report');
    Route::get('/pos_void_report', [SaleReportController::class, 'VoidReport'])->name('pos_void_report');

    // Cashier Report 
    Route::get('/pos_cash_report', [CashierReportController::class, 'CashReport'])->name('pos_cash_report');
    Route::get('/pos_online_pay', [CashierReportController::class, 'OnlinePay'])->name('pos_online_pay');
    Route::get('/pos_banking_report', [CashierReportController::class, 'BankingReport'])->name('pos_banking_report');

    // Management Report 
    Route::get('/pos_sales_category_amount', [ManagementReportController::class, 'SalesCategoryAmount'])->name('pos_sales_category_amount');
    Route::get('/pos_sales_category_qty', [ManagementReportController::class, 'SalesCategoryQty'])->name('pos_sales_category_qty');
    Route::get('/pos_customer_report', [ManagementReportController::class, 'customerReport'])->name('pos_customer_report');
    Route::get('/pos_customer_bill_history/{id}', [ManagementReportController::class, 'customerBillHistory'])->name('pos_customer_bill_history');

    // Cashier 
    Route::get('/cashier_main_page', [CashierMainController::class, 'index'])->name('cashier_main_page');
    Route::get('/cashier_order', [CashierOrderController::class, 'index'])->name('cashier_order');
    Route::get('/view_order_detail/{id}', [CashierOrderController::class, 'viewOrderDetail'])->name('view_order_detail');
    Route::post('/preview_payment', [CashierOrderController::class, 'previewPayment'])->name('preview_payment');
    Route::post('/submit_payment', [CashierOrderController::class, 'submitPayment'])->name('submit_payment');
    Route::get('/completed_cashier_order', [CashierCompletedOrderController::class, 'index'])->name('completed_cashier_order');

    // POS 
    Route::get('load_category_and_menu_pos/{type}/{category_id}', [MenuControlController::class, 'loadCategoryAndMenuListPos'])->name('load_category_and_menu_pos');










    // Purchase Group
    Route::resource('fixed_asset', FixedAssetsController::class);
    Route::get('get_fixed_by_id/{id}', [FixedAssetsController::class, 'getFixedById'])->name('get_fixed_by_id');
    Route::resource('variable_asset', VariableAssetsController::class);
    // Fixed Purchase 
    Route::resource('fixed_purchase', FixedPurchaseController::class);
    Route::resource('fixed_purchase_item', FixedPurchaseItemController::class);
    Route::get('fixed_purchase_item_delete/{id}', [FixedPurchaseItemController::class, 'delete'])->name('fixed_purchase_item_delete');
    Route::get('attachment_files/{id}', [FixedPurchaseController::class, 'attachmentFiles'])->name('attachment_files');
    Route::post('attachment_files_delete/{id}', [FixedPurchaseController::class, 'attachmentFilesDelete'])->name('attachment_files_delete');

    // Variable Purchase 
    Route::resource('variable_purchase', VariablePurchaseController::class);
    Route::resource('variable_purchase_item', VariablePurchaseItemController::class);
    Route::get('variable_purchase_item_delete/{id}', [VariablePurchaseItemController::class, 'delete'])->name('variable_purchase_item_delete');
    Route::get('variable_attachment_files/{id}', [VariablePurchaseController::class, 'attachmentFiles'])->name('variable_attachment_files');
    Route::post('variable_attachment_files_delete/{id}', [VariablePurchaseController::class, 'attachmentFilesDelete'])->name('variable_attachment_files_delete');

    // Purchase Add Delete  
    Route::post('store_temp_fixed_purchase_item', [TempFixedPurchaseItemController::class, 'store'])->name('store_temp_fixed_purchase_item');
    Route::get('get_temp_fixed_purchase_item', [TempFixedPurchaseItemController::class, 'index'])->name('get_temp_fixed_purchase_item');
    Route::get('remove_temp_fixed_purchase_item/{id}', [TempFixedPurchaseItemController::class, 'remove'])->name('remove_temp_fixed_purchase_item');

    // Inventory Damage
    Route::resource('fixed_damage', FixedDamageController::class);
    Route::resource('variable_damage', VariableDamageController::class);
});
