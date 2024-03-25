<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Batch;
use Illuminate\Http\Request;
use App\Models\Return_bell_order;
use App\Models\Return_item_order;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\BaseController as BaseController;
use App\Http\Resources\returnbill as returnbillResource;
use App\Http\Resources\returnitem as returnitemResource;
use App\Models\Sell_item_order;
use App\Models\Storage;

class ReturnBillController extends BaseController
{
    public function index($id)
    {
        $bills=Return_bell_order::latest()->where('sell_bell_order_id',$id)->get();
        return response()->json( [ 'bills'=>  returnbillResource::collection( $bills )] , 200);

    }

    public function show($id)
    {
        $bill=Return_bell_order::firstWhere('sell_bell_order_id', $id );
        $items=Return_item_order::where('return_bell_order_id',$bill->id)->get();
        return response()->json( [ 'bill'=>  new returnbillResource( $bill ),'items'=>returnitemResource::collection( $items )] , 200);

    }
    /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function create(Request $request)
    {
        $phparrays = $request->json()->all();
        $datas=$phparrays['med'];
        foreach( $datas as $i => $data){
            $validator = Validator::make($data , [
                'return_item_quantity'=>'required | numeric',
                'batch_id'=>'required '
            ]);
            if($validator->fails()){
                return $this->sendError( $validator->errors()->all() );
            }
        }
        $check=Return_bell_order::firstwhere('sell_bell_order_id',$data['sell_bell_order_id']);
        if(!is_null($check)){
            return $this->sendError('this bill have return bill already ! ');
        }



        $total =0;
        $bill= Return_bell_order::create([
            'date'=> Carbon::now(),
            'user_id'=> auth()->user()->id,
            'pharmacy_id'=> auth()->user()->pharmacy->id,
            'sell_bell_order_id'=> $data['sell_bell_order_id'],
        ]);
        foreach( $datas as $i => $data){
        $med=Batch::where('id', $data['batch_id'])->first();
        $soldquantity = Sell_item_order::where('sell_bell_order_id',$data['sell_bell_order_id'] )->where('batch_id',$med->id)->sum('sell_item_quantity');
        if($soldquantity<$data['return_item_quantity']){
            $bill->delete();
            return $this->sendError('Something went wrong ...');
        }

        $newitem = Return_item_order::create([
            'batch_id'=> $data['batch_id'],
            'return_item_quantity'=> $data['return_item_quantity'],
            'return_bell_order_id'=> $bill->id,
            'return_item_price'=>$med->drug->sell_price,

            ]);
            $storage = Storage::firstWhere('drug_id', $med->drug->id);
            $storage->storage_quantity = $storage->storage_quantity + $data['return_item_quantity'];
            $storage->save();
            $total= $total + $med->drug->sell_price * $data['return_item_quantity'];
             }
        $bill->total_return_price =$bill->total_return_price + $total ;
        $bill->save();
        return response()->json(['msg'=>'return bill created successfully '], 200  );

    }}
