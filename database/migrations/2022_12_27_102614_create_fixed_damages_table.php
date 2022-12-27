<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFixedDamagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fixed_damages', function (Blueprint $table) {
            $table->increments('id');
            $table->text('fixed_asset_id')->nullable();
            $table->text('damage_qty')->nullable();
            $table->text('causes_of_accidents')->nullable();
            $table->text('compensation')->nullable();
            $table->text('voucher_attach')->nullable();
            $table->text('remark')->nullable();
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
        Schema::dropIfExists('fixed_damages');
    }
}
