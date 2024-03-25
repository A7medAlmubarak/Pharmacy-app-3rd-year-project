<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBatchesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('batches', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('batch_quantity')->unsigned()->default(1);
            $table->date('expired_date');
            $table->date('date_of_entry');

            $table->integer('pharmacy_id')->unsigned();
            $table->foreign('pharmacy_id')->references('id')->on('pharmacies')->cascadeOnDelete();

            $table->integer('drug_id')->unsigned();
            $table->foreign('drug_id')->references('id')->on('drugs')->cascadeOnDelete();



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
        Schema::dropIfExists('batches');
    }
}
