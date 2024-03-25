<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Employee;
use App\Models\Pharmacy;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\BaseController as BaseController;
use App\Http\Resources\employee as employeeResource;

use App\Models\Location;
use GuzzleHttp\Client;
use Laravel\Passport\Client as OClient;
use Exception;


class UserController extends BaseController
{
    public function register( Request $request )
    {
    /********************* Validator ************************/
        $validator = Validator::make($request->all() , [
            'name'=>'required',
            'email'=>'required | email | unique:users',
            'location'=>'required | min:4 | max:40',
            'phone'=>'required | numeric ',
            'password'=>'required | min:5',
            'c_password'=>'required |same:password'
        ]);
        if($validator->fails()){
            return $this->sendError( $validator->errors()->all() );
        }

    /****************************** register **********************************/

        $pharmacy = Pharmacy::create([
            'location_id' => $this->checklocation($request),
            'name'=>$request->pharmacy_name

        ]);
        $input = $request->all();
        $input['pharmacy_id'] = $pharmacy->id;
        $input['password'] = Hash::make($input['password']);
            /** @var \App\Models\User $user **/
        $user = User::create($input);


        return response()->json(['msg'=>'user created successfully'], 200) ;
    }

    /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function login( Request $request )
    {

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password]))
        {

            /** @var \App\Models\User $user **/
            $user = Auth::user();
            $success ['token'] = $user->createtoken('A7med')->accessToken;
            $success ['name'] = $user->name;
            $success ['id'] =  $user->id;
            $success ['email'] =  $user->email;
            $success ['pharmacy_name'] =  $user->pharmacy->name;


            return response()->json(['msg'=>'User login successfully' ,'token'=>$success ['token'] ,'id'=>$success ['id'], 'name'=>$success ['name'] ,'email'=>$success ['email'] , 'pharmacy_name'=> $success ['pharmacy_name']  ], 200);
        }
        else
        {
            return $this->sendError(['email or password are wrong , please try again'] );
        }

    }



    /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function addemployee( Request $request )
    {
              $validator = Validator::make($request->all() , [
                'name'=>'required',
                'email'=>'required | email | unique:users',
                'password'=>'required | min:5',
                'c_password'=>'required |same:password',
                'phone'=>'required | numeric ',


            ]);
            if($validator->fails()){
                return $this->sendError( $validator->errors()->all() );
            }

       /****************************** add employee **********************************/

       $input = $request->all();
       $input['password'] = Hash::make($input['password']);
       $input['pharmacy_id'] = auth()->user()->pharmacy->id;

           /** @var \App\Models\User $user **/
       $user = User::create($input);
       $user->role_id = 2;
       $user->save();

       $employee = Employee::create([
        'user_id' => $user->id,
        'pharmacy_id' => auth()->user()->pharmacy->id ,
        'date' => Carbon::now()
       ]);

       return response()->json(['msg'=>'employee added successfully'], 200) ;

    }

    /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function softDeleteEmployee( $id ){
        $employee = User::firstWhere('id',$id);
        if(is_null($employee)){
            return $this->sendError('Page not found ' );
        }
        $tokens = $employee->tokens;
        foreach( $tokens as $token ){
            $token->revoked = true;
            $token->save();
        }
        $employee->delete();
        $em = Employee::firstWhere('user_id',$id);
        $em->delete();

        return response()->json(['msg'=>'employee deleted successfully'], 200) ;

    }
    public function employeeList(Request $request)
    {
        $list = Employee::all()->where('pharmacy_id',auth()->user()->pharmacy->id);
        if(is_null($list)){
            return response()->json(['msg'=>'there is no employee !'], 200) ;
        }
            else{
                return response()->json( employeeResource::collection( $list ) , 200);
            }
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

	 /*************************************************************************************************************/
    /*************************************************************************************************************/

    public function  editEmployee($id){

        $employee=User::select('name','email','phone')->find($id);
        if (!$employee){
            return $this->sendError('user not found');
        }
        return response()->json($employee, 200);
        }
        public function  updateEmployee(Request  $request,$id){

            $employee=User::find($id);
            if (!$employee){
                return $this->sendError('user not found');
            }
            $validator = Validator::make($request->all() , [
                'name'=>'required',
                'email'=>'required | email | unique:users,email,'. $id .'',
                'phone'=>'required | numeric ',
            ]);
            if($validator->fails()){
                return $this->sendError( $validator->errors()->first() );
            }
            $employee->update([
                'name'=>$request->name,
                'email'=>$request->email,
                'phone'=>$request->phone,
            ]);
            return response()->json(['msg'=>'employee updated successfully'], 200) ;
        }




}
