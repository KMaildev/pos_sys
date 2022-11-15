<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->increments('id');
            $table->text('customer_id')->nullable();
            $table->text('name')->nullable();
            $table->text('primary_number')->nullable();
            $table->text('additional_number')->nullable();
            $table->text('email')->nullable();
            $table->text('address')->nullable();
            $table->text('date_of_birth')->nullable();
            $table->text('join_date')->nullable();
            $table->text('remark')->nullable();
            $table->text('gender')->nullable();
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
        Schema::dropIfExists('customers');
    }
}
