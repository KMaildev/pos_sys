<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockInsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_ins', function (Blueprint $table) {
            $table->increments('id');
            $table->text('ingredient_id')->nullable();
            $table->text('stock_in_date')->nullable();
            $table->text('purchase_unit')->nullable();
            $table->text('price_per_unit')->nullable();
            $table->text('total_stock_value')->nullable();
            $table->text('store_id')->nullable();
            $table->text('user_id')->nullable();
            $table->text('session_id')->nullable();
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
        Schema::dropIfExists('stock_ins');
    }
}
