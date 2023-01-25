<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVoidItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('void_items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('order_info_id')->nullable();
            $table->integer('menu_list_id')->nullable();
            $table->text('qty')->nullable();
            $table->text('price')->nullable();
            $table->text('remark')->nullable();
            $table->text('waiter_user_id')->nullable();
            $table->text('preparation_status')->nullable();
            $table->text('preparation_date')->nullable();
            $table->text('preparation_user_id')->nullable();
            $table->text('difference_time')->nullable();
            $table->text('manager_remark')->nullable();
            $table->text('menu_name')->nullable();
            $table->text('split_qty')->nullable();
            $table->text('reason')->nullable();
            $table->text('void_by')->nullable();
            $table->text('void_date')->nullable();
            $table->text('void_time')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('void_items');
    }
}
