<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserAkunsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_akuns', function (Blueprint $table) {
            $table->id();
            $table->string('namaDepan')->nullable();
            $table->string('namaBelakang');
            $table->string('ttl');
            $table->enum('gender', ['pria', 'wanita']);
            $table->unsignedBigInteger('membership');
            $table->foreign('membership')->references('id')->on('user_memberships')->onUpdate('cascade')->onDelete('restrict');
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
        Schema::dropIfExists('user_akuns');
    }
}
