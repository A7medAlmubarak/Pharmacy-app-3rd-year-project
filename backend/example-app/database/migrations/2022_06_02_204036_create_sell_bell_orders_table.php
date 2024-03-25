<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSellBellOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sell_bell_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->date('date');
            $table->integer('total_sell_price')->unsigned()->default(0);

            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->cascadeOnDelete();

            $table->integer('pharmacy_id')->unsigned();
            $table->foreign('pharmacy_id')->references('id')->on('pharmacies')->cascadeOnDelete();


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
        Schema::dropIfExists('sell_bell_orders');
    }
}
