<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBuyBillOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('buy_bill_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->date('date');
            $table->integer('total_buy_price')->unsigned()->default(0);

            $table->integer('distributor_id')->unsigned();
            $table->foreign('distributor_id')->references('id')->on('distributors')->cascadeOnDelete();

            $table->integer('admin_id')->unsigned();
            $table->foreign('admin_id')->references('id')->on('users')->cascadeOnDelete();

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
        Schema::dropIfExists('buy_bill_orders');
    }
}
