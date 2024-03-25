<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSellItemOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sell_item_orders', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('batch_id')->unsigned();
            $table->foreign('batch_id')->references('id')->on('batches')->cascadeOnDelete();

            $table->integer('sell_item_quantity')->unsigned()->default(1);
            $table->integer('sell_item_price')->unsigned()->default(1);


            $table->integer('sell_bell_order_id')->unsigned();
            $table->foreign('sell_bell_order_id')->references('id')->on('sell_bell_orders')->cascadeOnDelete();

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
        Schema::dropIfExists('sell_item_orders');
    }
}
