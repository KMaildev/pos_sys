<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderInfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_infos', function (Blueprint $table) {
            $table->increments('id');
            $table->text('customer_id')->nullable();
            $table->text('table_list_id')->nullable();

            $table->text('order_no')->nullable();
            $table->text('inv_no')->nullable();
            $table->text('order_date_time')->nullable();
            $table->text('order_date')->nullable();
            $table->text('order_time')->nullable();
            $table->text('check_out_status')->nullable();
            $table->text('check_out_time')->nullable();

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
        Schema::dropIfExists('order_infos');
    }
}
