<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTempFixedPurchaseItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('temp_fixed_purchase_items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('temp_id')->nullable();
            $table->text('temp_name')->nullable();
            $table->text('qty')->nullable();
            $table->text('cost')->nullable();
            $table->text('remark')->nullable();
            $table->text('session_id')->nullable();
            $table->text('user_id')->nullable();
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
        Schema::dropIfExists('temp_fixed_purchase_items');
    }
}
