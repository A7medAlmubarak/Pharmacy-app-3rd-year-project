<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBuyItemOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('buy_item_orders', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('batch_id')->unsigned();
            $table->foreign('batch_id')->references('id')->on('batches')->cascadeOnDelete();

            $table->integer('buy_item_quantity')->unsigned()->default(1);
            $table->integer('buy_item_price')->unsigned()->default(1);

            $table->integer('buy_bill_order_id')->unsigned();
            $table->foreign('buy_bill_order_id')->references('id')->on('buy_bill_orders')->cascadeOnDelete();



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
        Schema::dropIfExists('buy_item_orders');
    }
}
