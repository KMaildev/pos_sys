<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIngredientListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ingredient_lists', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ingredient_id')->nullable();
            $table->integer('menu_list_id')->nullable();
            $table->text('ingredient_name')->nullable();
            $table->text('qty')->nullable();
            $table->text('one_kg_price')->nullable();
            $table->text('price_kg')->nullable();
            $table->text('total_amount')->nullable();
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
        Schema::dropIfExists('ingredient_lists');
    }
}
