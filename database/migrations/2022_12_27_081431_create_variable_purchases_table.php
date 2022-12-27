<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVariablePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('variable_purchases', function (Blueprint $table) {
            $table->increments('id');
            $table->text('supplier_id')->nullable();
            $table->text('invoice_no')->nullable();
            $table->text('purchase_date')->nullable();
            $table->text('remark')->nullable();
            $table->text('total_amount')->nullable();
            $table->text('representative_id')->nullable();
            $table->text('user_id')->nullable();
            $table->text('date_at')->nullable();
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
        Schema::dropIfExists('variable_purchases');
    }
}
