<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\Distributor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\Http\Controllers\BaseController as BaseController;
use App\Http\Resources\distributor as DistributorResource;


class DistributorController extends BaseController
{
    public function index()
    {
       /** @var \App\Models\User $user **/
          $admin = auth('api')->user() ;
        $distributors=Distributor::where('admin_id',$admin->id)->orderBy('name')->get();
        return response()->json(['Distributor'=> DistributorResource::collection( $distributors ) ], 200);
    }

    public function show( $id )
    {
        $distributor = Distributor::firstWhere('id',$id);
        if(is_null($distributor)){
            return $this->sendError('Page not found ' );
        }
        return response()->json(['distributor'=> new DistributorResource( $distributor )], 200);
    }

    public function create(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input , [
            'name'=>'required | max:30',
            'phone'=>'required | numeric ',
            'email'=>'required |  email |unique:distributors',
            'location'=>'required | max:30',
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors()->all() );
        }
        $drug=Distributor::create([
            'name'=>$request->name,
            'admin_id'=> auth()->user()->id,
            'location_id'=>$this->checklocation($request),
            'phone'=> $request->phone ,
            'email'=> $request->email

        ]);
        return response()->json(['msg'=>'Distributor created successfully '], 200  );
    }

    public function softdelete( $id , Request $request )
    {
        $distributor = Distributor::firstWhere('id',$id);
        if(is_null($distributor)){
            return $this->sendError('Page not found ' );
        }
        $distributor->delete();
        return response()->json(['msg'=>'Distributor deleted successfully '], 200  );
    }

    public function edit( $id , Request $request)
    {
        $distributor = Distributor::firstWhere('id',$id);
        if(is_null($distributor)){
            return $this->sendError('Page not found ' );
        }

        $validator = Validator::make($request->all() , [
            'name'=>' max:30',
            'phone'=>' numeric ',
            'email'=>' email |unique:distributors,email,'. $id .'',
            'location'=>' max:30',

        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }
        if( !is_null( $request->name) ) { $distributor->name = $request->name; }
        if( !is_null( $request->phone) ) { $distributor->phone = $request->phone; }
        if( !is_null( $request->email) ) { $distributor->email = $request->email; }
        if( !is_null( $request->location) ) { $distributor->location_id = $this->checklocation($request); }

            $distributor->save();
        return response()->json(['msg'=>'distributor updated'] ,200);
    }

    public function checklocation(Request $request)
    {
        $location = Location::firstWhere('name',$request->location);
        if(is_null($location)){
            $temp=Location::create([
                'name'=>$request->location
            ]);
            return  $temp->id ;        }
        else{
            return $location->id;
        }
    }

}
