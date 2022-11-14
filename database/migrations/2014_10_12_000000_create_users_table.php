<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');

            $table->string('employee_id')->nullable();
            $table->string('phone')->unique()->nullable();
            $table->string('nrc_number')->nullable();
            $table->text('gender')->nullable();
            $table->text('address')->nullable();
            $table->text('department_id')->nullable();
            $table->integer('is_banned')->default(1);

            $table->text('last_login_at')->nullable();
            $table->text('last_login_ip')->nullable();
            $table->text('agent')->nullable();
            $table->text('nrc_front')->nullable();
            $table->text('nrc_back')->nullable();
            $table->text('members_list_file')->nullable();
            $table->text('other_file')->nullable();
            $table->text('leave_date')->nullable();
            $table->text('leave_remark')->nullable();
            $table->text('leave_by')->nullable();

            $table->text('contact_person')->nullable();
            $table->text('emergency_contact')->nullable();
            $table->text('passport_photo')->nullable();
            $table->text('join_date')->nullable();
            $table->text('employment_type')->nullable();

            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
