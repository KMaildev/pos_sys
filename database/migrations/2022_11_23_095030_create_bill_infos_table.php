<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBillInfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bill_infos', function (Blueprint $table) {
            $table->increments('id');
            $table->text('order_info_id')->nullable();

            $table->text('customer_id')->nullable();
            $table->text('table_list_id')->nullable();

            $table->text('bill_date_time')->nullable();
            $table->text('bill_time')->nullable();

            $table->text('payment_type')->nullable();
            $table->text('total_amount')->nullable();
            $table->text('tax_amount')->nullable();
            $table->text('discount')->nullable();
            $table->text('service_charges')->nullable();
            $table->text('net_amount')->nullable();
            $table->text('received_amount')->nullable();
            $table->text('cashier_user_id')->nullable();
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
        Schema::dropIfExists('bill_infos');
    }
}
