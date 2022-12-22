<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFixedPurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fixed_purchases', function (Blueprint $table) {
            $table->increments('id');
            $table->text('supplier_id')->nullable();
            $table->text('invoice_no')->nullable();
            $table->text('purchase_date')->nullable();
            $table->text('remark')->nullable();
            $table->text('total_amount')->nullable();
            $table->text('representative_id')->nullable();
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
        Schema::dropIfExists('fixed_purchases');
    }
}
