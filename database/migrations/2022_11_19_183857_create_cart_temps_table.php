<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartTempsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cart_temps', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('menu_list_id')->nullable();
            $table->text('qty')->nullable();
            $table->text('price')->nullable();
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
        Schema::dropIfExists('cart_temps');
    }
}
