<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Employee;
use Illuminate\Http\Request;
use App\Models\Sell_bell_order;
use App\Models\Sell_item_order;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\Batch;
use App\Models\Buy_item_order;
use App\Models\Drug;
use App\Models\Storage;
use App\Http\Resources\sellbill as sellbillResource;
use App\Http\Resources\sellitem as sellitemResource;
use App\Models\Return_bell_order;

class SellBillController extends BaseController
{
    public function index()
    {
        $bills=Sell_bell_order::latest()->where('pharmacy_id', auth()->user()->pharmacy->id)->get();
        return response()->json( [ 'bills'=>  sellbillResource::collection( $bills )] , 200);

    }

    public function show($id)
    {
        $bill=Sell_bell_order::firstWhere('id', $id );
        $items=Sell_item_order::where('sell_bell_order_id',$id)->get();

        $returnbill=Return_bell_order::firstWhere('sell_bell_order_id',$id);
        if(is_null($returnbill)){
            $return_status=0;
                    }
        else{
            $return_status=1;
        }
        return response()->json( ['bill'=>  new sellbillResource( $bill ), 'items'=>sellitemResource::collection( $items ) , 'return_status'=>$return_status] , 200);
    }

    /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function create(Request $request)
    {
        $phparrays = $request->json()->all();
        $datas=$phparrays['med'];
        foreach( $datas as $i => $data){
            $validator = Validator::make($data , [
                'drug_id' =>'required',
                'sell_item_quantity'=>'required',

            ]);
            if($validator->fails()){
                return $this->sendError( $validator->errors()->all() );
            }
        }
        $total =0;
        $income =0;

        /** @var \App\Models\User $user **/
        $user = auth('api')->user();
        $bill= Sell_bell_order::create([
            'date'=> Carbon::now(),
            'user_id'=> auth()->user()->id,
            'pharmacy_id'=> auth()->user()->pharmacy->id
        ]);
        foreach( $datas as $i => $data){

        $med=Batch::where('drug_id', $data['drug_id'])->orderBy('expired_date')->first();
        $newitem = Sell_item_order::create([
            'batch_id'=> $med->id,
            'sell_item_quantity'=>$data['sell_item_quantity'],
            'sell_item_price'=>$med->drug->sell_price,
            'sell_bell_order_id'=>$bill->id,
            ]);
                 $med->batch_quantity = $med->batch_quantity - $data['sell_item_quantity'];
                 $med->save();
                 $storage = Storage::firstWhere('drug_id', $med->drug->id);
                 $storage->storage_quantity = $storage->storage_quantity - $data['sell_item_quantity'];
                 $storage->save();
                 $total= $total + $med->drug->sell_price * $data['sell_item_quantity'];
             }
        $bill['total_sell_price']=$total;
        $bill->save();

        return response()->json(['msg'=>'sell bill created successfully '], 200  );

    }

    public function searchByNum(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'num'=>'required | numeric ',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        $bill=Sell_bell_order::where('id',$request->num)->where('pharmacy_id',auth()->user()->pharmacy->id)->get();
        if(!$bill)
        {
            return $this->sendError('not found');
        }
         return response()->json( [ 'bills'=>  sellbillResource::collection( $bill )] , 200);
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

        $bills=Sell_bell_order::latest()
        ->where('pharmacy_id', auth()->user()->pharmacy->id )
        ->where('date','<',$request->todate)
        ->where('date','>',$request->fromdate)
        ->get();

        if($bills->isEmpty())
        {
            return $this->sendError('not found');
        }

         return response()->json( [ 'bills'=>  sellbillResource::collection( $bills )] , 200);
    }

    public function searchByEmployee($id)
    {
        $bills=Sell_bell_order::where('pharmacy_id',auth()->user()->pharmacy->id )->where('user_id',$id )->get();
        if($bills->isEmpty())
        {
            return $this->sendError('not found');
        }

         return response()->json( [ 'bills'=>  sellbillResource::collection( $bills )] , 200);
    }


}
