<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReturnItemOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('return_item_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('return_item_quantity')->unsigned()->default(1);
            $table->integer('return_item_price')->unsigned()->default(1);


            $table->integer('return_bell_order_id')->unsigned();
            $table->foreign('return_bell_order_id')->references('id')->on('return_bell_orders')->cascadeOnDelete();

            $table->integer('batch_id')->unsigned();
            $table->foreign('batch_id')->references('id')->on('batches')->cascadeOnDelete();

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
        Schema::dropIfExists('return_item_orders');
    }
}
