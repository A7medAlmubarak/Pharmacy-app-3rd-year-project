<?php

namespace App\Http\Controllers;

use App\Models\Drug;
use App\Models\Storage;
use App\Models\Pharmacy;
use App\Models\ScientificMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\BaseController as BaseController;
use App\Http\Resources\med as medResource;
use App\Models\Company;

class MedController extends BaseController
{
    public function index()
    {
        $drugs=Drug::orderBy('name')->get();
        return response()->json(['Meds'=> medResource::collection( $drugs ) ], 200);
    }


    public function show( $id )
    {
        $drug=Drug::firstWhere('id',$id);
        if(is_null($drug)){
            return $this->sendError('Page not found ');
        }
        return response()->json(['Med'=> new medResource( $drug ) ], 200);
    }

    /**************************************************************************/

    public function create(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input , [
            'name'=>'required | max:30',
            'sell_price'=>'required | integer',
            'barcode_number'=>'required | numeric | unique:drugs,barcode_number',
            'category_id'=>'required | numeric | min:0 | max:20',
            'company'=>'required | min:0 | max:25',
            'scientific_material'=>'required | max:50',
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors()->all() );
        }
        $drug=Drug::create([
            'name'=>$request->name,
            'sell_price'=>$request->sell_price,
            'barcode_number'=>$request->barcode_number,
            'category_id'=>$request->category_id,
            'company_id'=> $this->checkcompany($request),
            'scientific_material_id'=> $this->checkScientificMaterials($request)
        ]);
        return response()->json(['msg'=>'Drug created successfully '], 200  );
    }
    public function checkcompany(Request $request)
    {
        $company = Company::firstWhere('name',$request->company);
        if(is_null($company)){
            $temp=Company::create([
                'name'=>$request->company
            ]);
            return  $temp->id ;        }
        else{
            return $company->id;
        }
    }

    public function checkScientificMaterials(Request $request)
    {
        $scientificmaterial = ScientificMaterial::firstWhere('name',$request->scientific_material);
        if(is_null($scientificmaterial)){
            $temp=ScientificMaterial::create([
                'name'=>$request->scientific_material
            ]);
            return  $temp->id ;        }
        else{
            return $scientificmaterial->id;
        }
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

    /**************************************************************************/

    public function edit( $id , Request $request)
    {
        $validator = Validator::make($request->all() , [
            'name'=>' max:30',
            'sell_price'=>'integer',
            'category_id'=>' numeric | min:0 | max:20',
            //'company_id'=>'numeric | min:0 | max:20',
            'company'=>' min:0 | max:20',
            'scientific_material'=>' max:50',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        $drug = Drug::firstWhere('id',$id);
        if( !is_null( $request->name) ) { $drug->name = $request->name; }
        if( !is_null( $request->sell_price) ) { $drug->sell_price = $request->sell_price; }
        if( !is_null( $request->category_id) ) { $drug->category_id = $request->category_id; }
        if( !is_null( $request->company) ) { $drug->company_id = $this->checkcompany($request); }
        if( !is_null( $request->scientific_material) ) { $drug->scientific_material_id = $this->checkScientificMaterials($request); }
            $drug->save();
        return response()->json(['msg'=>'drug updated'] ,200);
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

        return response()->json(['Meds'=> medResource::collection( $drugs ) ], 200);
    }

    public function searchByBarcode(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'barcode_number'=>'required | numeric ',
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        $drugs=Drug::where('barcode_number',$request->barcode_number )->get();
        if($drugs->isEmpty())
        {
            return $this->sendError('not found');
        }

        return response()->json(['Meds'=> medResource::collection( $drugs ) ], 200);
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
        if($temp==0){return $this->sendError('not found');}

        $drugs=Drug::where('scientific_material_id',$temp )->get();
        if($drugs->isEmpty())
        {
            return $this->sendError('not found');
        }

        return response()->json(['Meds'=> medResource::collection( $drugs ) ], 200);
    }



}
