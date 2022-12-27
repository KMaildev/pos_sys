<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVariablePurchaseItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('variable_purchase_items', function (Blueprint $table) {
            $table->increments('id');
            $table->text('variable_purchase_id')->nullable();
            $table->text('fixed_asset_id')->nullable();
            $table->text('qty')->nullable();
            $table->text('cost')->nullable();
            $table->text('remark')->nullable();
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
        Schema::dropIfExists('variable_purchase_items');
    }
}
