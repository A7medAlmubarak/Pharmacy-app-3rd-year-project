<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Drug;
use App\Models\Batch;
use App\Models\Storage;
use App\Models\Pharmacy;
use Illuminate\Http\Request;
use App\Models\Buy_bill_order;
use App\Models\Sell_bell_order;
use App\Models\Sell_item_order;
use App\Models\Return_bell_order;
use App\Models\ScientificMaterial;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\med as medResource;
use App\Http\Resources\batch as batchResource;
use App\Http\Resources\storage as storageResource;
use App\Http\Controllers\BaseController as BaseController;



class PharmacyController extends BaseController
{


    public function myPharmacy()
    {
         $myDrugs=Storage::where('pharmacy_id',auth()->user()->pharmacy->id)->get();
         return response()->json( storageResource::collection( $myDrugs ) , 200);

    }

    public function myMed( $id ) //show
    {
            $med = Drug::firstWhere('id',$id);
            $batchs = Batch::where('drug_id',$id)->where('pharmacy_id',auth()->user()->pharmacy->id)->get();
            $myMed['id']=$med->id;
            $myMed['name']=$med->name;
            $myMed['sell_price']=$med->sell_price;
            $myMed['category']=$med->category->name;
            $myMed['scientific_material']=$med->scientific_material->name;
            $myMed['company']=$med->company->name;
            $myMed['barcode_number']=$med->barcode_number;
            $myMed['batchs']= batchResource::collection( $batchs );
            return response()->json( $myMed , 200);
    }

    public function searchByName(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'name'=>'required | max:50',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }

        $drugs=Drug::where('name','like', '%'.$request->name.'%' )->get();
        if($drugs->isEmpty())
        {
            return $this->sendError('not found');
        }
        foreach($drugs as $drug){
            $med=Storage::where('drug_id',$drug->id)->where('pharmacy_id',auth()->user()->pharmacy->id)->first();
            if(!is_null($med)){
                $meds[]=$med;
            }
        }
        if(!count($meds)){
            return $this->sendError('not found');
        }
        return response()->json( ['Meds'=>storageResource::collection( $meds ) ], 200);
    }

    public function searchByBarcode(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'barcode_number'=>'required | numeric ',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        $drug=Drug::where('barcode_number',$request->barcode_number )->first();
        if(!is_null($drug)){
            $med=Storage::firstWhere('drug_id',$drug->id)->where('pharmacy_id',auth()->user()->pharmacy->id);
            if(!is_null($med)){
                $meds=Storage::where('drug_id',$drug->id)->where('pharmacy_id',auth()->user()->pharmacy->id)->get();
                return response()->json( ['Meds'=>storageResource::collection( $meds ) ], 200);
            }
        }
        return $this->sendError('not found');
    }

    public function searchByScien(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'scientific_material'=>'required',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        $temp = $this->findScientificMaterials($request);
        if($temp==0){ return $this->sendError('not found');  }

        $drugs=Drug::where('scientific_material_id',$temp)->get();
        foreach($drugs as $drug){
            $med=Storage::where('drug_id',$drug->id)->where('pharmacy_id',auth()->user()->pharmacy->id)->first();
            if(!is_null($med)){
                $meds[]=$med;
            }
        }
        if(!count($meds))
        {
            return $this->sendError('not found');
        }
        return response()->json( ['Meds'=>storageResource::collection( $meds ) ], 200);
    }

    public function incomeMonth()
    {
            $days=0;
            while($days<31){
                $date= Carbon::today()->subDays($days)->format('Y-m-d');
                $in = Sell_bell_order::where( 'pharmacy_id' ,auth()->user()->pharmacy->id)->where('date',$date)->sum('total_sell_price');
                $re = Return_bell_order::where( 'pharmacy_id' ,auth()->user()->pharmacy->id)->where('date',$date)->sum('total_return_price');
                $income[] = ['date'=>$date, 'income'=>$in  - $re];
                $days=$days+1;
            }
            return response()->json( $income , 200);
    }

    public function incomeWeekly()
    {
        $days=0;
        while($days<7){
            $date= Carbon::today()->subDays($days)->format('Y-m-d');
            $in = Sell_bell_order::where( 'pharmacy_id' ,auth()->user()->pharmacy->id)->where('date',$date)->sum('total_sell_price');
            $re = Return_bell_order::where( 'pharmacy_id' ,auth()->user()->pharmacy->id)->where('date',$date)->sum('total_return_price');
            $income[] = ['date'=>$date, 'income'=>$in  - $re];
            $days=$days+1;
        }
        return response()->json( $income , 200);
    }

    public function outcomeMonth()
    {
            $days=0;
            while($days<31){
                $date= Carbon::today()->subDays($days)->format('Y-m-d');
                $out = Buy_bill_order::where( 'pharmacy_id' ,auth()->user()->pharmacy->id)->where('date',$date)->sum('total_buy_price');
                $income[] = ['date'=>$date, 'income'=> $out+0];
                $days=$days+1;
            }
            return response()->json( $income , 200);
    }

    public function outcomeWeekly()
    {
        $days=0;
        while($days<7){
            $date= Carbon::today()->subDays($days)->format('Y-m-d');
            $out = Buy_bill_order::where( 'pharmacy_id' ,auth()->user()->pharmacy->id)->where('date',$date)->sum('total_buy_price');
            $income[] = ['date'=>$date, 'income'=> $out-0];
            $days=$days+1;
        }
        return response()->json( $income , 200);
    }




    public function findScientificMaterials(Request $request)
    {
        $scientificmaterial = ScientificMaterial::firstWhere('name',$request->scientific_material);
        if(is_null($scientificmaterial)){
            return  0;        }
        else{
            return $scientificmaterial->id;
        }
    }

}
