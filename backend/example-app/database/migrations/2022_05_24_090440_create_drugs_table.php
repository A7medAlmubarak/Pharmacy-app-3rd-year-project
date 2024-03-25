<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDrugsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('drugs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('barcode_number')->unique();
            $table->integer('sell_price');

            $table->integer('category_id')->unsigned();
            $table->foreign('category_id')->references('id')->on('categories')->cascadeOnDelete();

            $table->integer('scientific_material_id')->unsigned();
            $table->foreign('scientific_material_id')->references('id')->on('scientific_materials')->cascadeOnDelete();

            $table->integer('company_id')->unsigned();
            $table->foreign('company_id')->references('id')->on('companies')->cascadeOnDelete();


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
        Schema::dropIfExists('drugs');
    }
}
