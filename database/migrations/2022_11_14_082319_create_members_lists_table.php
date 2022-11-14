<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMembersListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('members_lists', function (Blueprint $table) {
            $table->increments('id');
            $table->text('members_list_file')->nullable();
            $table->text('original_name')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('insert_user_id')->nullable();
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
        Schema::dropIfExists('members_lists');
    }
}
