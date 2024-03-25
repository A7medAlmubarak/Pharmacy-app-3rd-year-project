<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MedController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BuyBillController;
use App\Http\Controllers\PharmacyController;
use App\Http\Controllers\SellBillController;
use App\Http\Controllers\ReturnBillController;
use App\Http\Controllers\DistributorController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


/**************************************************************************/

Route::post('register',[ UserController::class , 'register']);
Route::post('login',[ UserController::class , 'login']);

Route::middleware('auth:api')->group(function () {

    Route::get('incomemonthly',[ PharmacyController::class , 'incomeMonth']);
    Route::get('incomeWeekly',[ PharmacyController::class , 'incomeWeekly']);

    Route::get('outcomeMonth',[ PharmacyController::class , 'outcomeMonth']);
    Route::get('outcomeWeekly',[ PharmacyController::class , 'outcomeWeekly']);


    Route::group(['prefix' => 'med'], function(){
            Route::post('create',[ MedController::class , 'create']);
            Route::post('edit/{id}',[ MedController::class , 'edit']);
            Route::get('show/{id}',[ MedController::class , 'show']);
            Route::get('index',[ MedController::class , 'index']);
            Route::post('searchByName',[ MedController::class , 'searchByName']);
            Route::post('searchByBarcode',[ MedController::class , 'searchByBarcode']);
            Route::post('searchByScien',[ MedController::class , 'searchByScien']);
        });

    Route::group(['prefix' => 'profile'], function()
    {
        Route::group(['prefix' => 'buybill'], function(){
            Route::get('index',[ BuyBillController::class , 'index']);
            Route::get('show/{id}',[ BuyBillController::class , 'show']);
            Route::post('create',[ BuyBillController::class , 'create']);
            Route::post('searchByDate',[ BuyBillController::class , 'searchByDate']);
            Route::post('searchByNum',[ BuyBillController::class , 'searchByNum']);
            Route::get('searchBySupp/{id}',[ BuyBillController::class , 'searchBySupp']);
        });

        Route::group(['prefix' => 'sellbill'], function(){
            Route::get('index',[ SellBillController::class , 'index']);
            Route::get('show/{id}',[ SellBillController::class , 'show']);
            Route::post('create',[ SellBillController::class , 'create']);
            Route::post('searchByDate',[ SellBillController::class , 'searchByDate']);
            Route::post('searchByNum',[ SellBillController::class , 'searchByNum']);
            Route::get('searchByEmployee/{id}',[ SellBillController::class , 'searchByEmployee']);
        });

        Route::group(['prefix' => 'returnbill'], function(){
            Route::get('index/{id}',[ ReturnBillController::class , 'index']);
            Route::get('show/{id}',[ ReturnBillController::class , 'show']);
            Route::post('create',[ ReturnBillController::class , 'create']);

        });
        Route::group(['prefix' => 'med'], function(){
            Route::get('index',[ PharmacyController::class , 'myPharmacy']);
            Route::get('show/{id}',[ PharmacyController::class , 'myMed']);
            Route::post('searchByName',[ PharmacyController::class , 'searchByName']);
            Route::post('searchByBarcode',[ PharmacyController::class , 'searchByBarcode']);
            Route::post('searchByScien',[ PharmacyController::class , 'searchByScien']);




        });

        Route::group(['prefix' => 'employee'], function(){
            Route::post('create',[ UserController::class , 'addemployee']);
            Route::get('delete/{id}',[ UserController::class , 'softDeleteEmployee']);
            Route::get('index',[ UserController::class , 'employeeList']);
            Route::post('edit/{id}',[ UserController::class , 'updateEmployee']);
        });

        Route::group(['prefix' => 'distributor'], function(){
            Route::post('create',[ DistributorController::class , 'create']);
            Route::get('index',[ DistributorController::class , 'index']);
            Route::get('delete/{id}',[ DistributorController::class , 'softdelete']);
            Route::get('show/{id}',[ DistributorController::class , 'show']);
            Route::post('edit/{id}',[ DistributorController::class , 'edit']);
        });

    });

});

/**************************************************************************/




Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
