<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVariablePurchaseFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('variable_purchase_files', function (Blueprint $table) {
            $table->increments('id');
            $table->text('attachments')->nullable();
            $table->text('original_name')->nullable();
            $table->text('user_id')->nullable();
            $table->text('date_at')->nullable();
            $table->text('variable_purchase_id')->nullable();
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
        Schema::dropIfExists('variable_purchase_files');
    }
}
