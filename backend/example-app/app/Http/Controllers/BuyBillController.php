<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Batch;
use Illuminate\Http\Request;
use App\Models\Buy_bill_order;
use App\Models\Buy_item_order;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\Pharmacy;
use App\Models\Storage;
use App\Http\Resources\buybill as buybillResource;
use App\Http\Resources\buyitem as buyitemResource;



class BuyBillController extends BaseController
{
    public function index()
    {

        $bills=Buy_bill_order::latest()->where('pharmacy_id', auth()->user()->pharmacy->id )->get();
        return response()->json( [ 'bills'=>  buybillResource::collection( $bills )] , 200);
    }

    public function show($id)
    {
        $bill=Buy_bill_order::firstWhere('id', $id );
        $items=Buy_item_order::where('buy_bill_order_id',$id)->get();
        return response()->json( [ 'bill'=>  new buybillResource( $bill ),'items'=>buyitemResource::collection( $items )] , 200);
    }


    /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function create(Request $request)
    {
        $phparrays = $request->json()->all();
        $datas=$phparrays['med'];
        foreach( $datas as $i => $data){
            $validator = Validator::make($data , [
                'quantity' =>'required',
                //'expired_date'=>'required | date',
                'drug_id'=>'required | numeric',
                'buy_item_price'=>'required | numeric'
            ]);
            if($validator->fails()){
                return $this->sendError( $validator->errors()->all() );
            }
        }
        $total =0;
        /** @var \App\Models\User $user **/
        $admin = auth('api')->user();
        $bill= Buy_bill_order::create([
            'date'=> Carbon::now(),
            'admin_id'=>  auth()->user()->id,
            'distributor_id'=>$phparrays['distributor_id'],
            'pharmacy_id'=> auth()->user()->pharmacy->id,

        ]);
        foreach( $datas as $i => $data){
        $newBatch = Batch::create([
            'batch_quantity'=>$data['quantity'],
           // 'expired_date'=>$data['expired_date'],
           'expired_date'=>Carbon::now()->addMonth(rand(2,12))->format('Y-m-1'),
            'drug_id'=>$data['drug_id'],
            'pharmacy_id'=> auth()->user()->pharmacy->id,
            'date_of_entry'=> Carbon::now()
        ]);
        $newitem = Buy_item_order::create([
            'batch_id'=>$newBatch->id,
            'buy_item_quantity'=>$data['quantity'],
            'buy_item_price'=>$data['buy_item_price'],
            'buy_bill_order_id'=>$bill->id,
        ]);
        $total = $total + $data['buy_item_price'] * $data['quantity']   ;

        $checkStorage = Storage::where('drug_id',$data['drug_id'] )->first();
        if(is_null($checkStorage)){
            $temp=Storage::create([
                'drug_id'=>$data['drug_id'],
                'pharmacy_id'=> auth()->user()->pharmacy->id,
                'storage_quantity'=>$data['quantity']
                ]);
             }
        else{
            $checkStorage->storage_quantity=$checkStorage->storage_quantity + $data['quantity'];
            $checkStorage->save();
            }
        }

        $bill['total_buy_price']=$total;
        $bill->save();
        return response()->json(['msg'=>'buy bill created successfully '], 200  );

    }

    /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function searchByNum(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'num'=>'required | numeric ',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        $bill=Buy_bill_order::where('id',$request->num)->where('pharmacy_id',auth()->user()->pharmacy->id)->get();
        if(!$bill)
        {
            return $this->sendError('not found');
        }
        return response()->json( [ 'bills'=>  buybillResource::collection( $bill )] , 200);
    }

    public function searchByDate(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'todate'=>'required | date | after:11/01/1940 ',
            'fromdate'=>'required | date | after:11/01/1940 | before:todate',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        $bills=Buy_bill_order::latest()
        ->where('pharmacy_id', auth()->user()->pharmacy->id )
        ->where('date','<',$request->todate)
        ->where('date','>',$request->fromdate)
        ->get();
        if($bills->isEmpty())
        {
            return $this->sendError('not found');
        }

         return response()->json( [ 'bills'=>  buybillResource::collection( $bills )] , 200);
    }

    public function searchBySupp($id)
    {
        $bills=Buy_bill_order::where('pharmacy_id',auth()->user()->pharmacy->id )->where('distributor_id',$id )->get();
        if($bills->isEmpty())
        {
            return $this->sendError('not found');
        }
         return response()->json( [ 'bills'=>  buybillResource::collection( $bills )] , 200);
    }

}
