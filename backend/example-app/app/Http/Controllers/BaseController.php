<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class BaseController extends Controller
{
    public function sendResponse ( $result , $message)
    {
     /*   $response = [
            'success'=> true,
            'data'=> $result ,
            'message'=>  $message
        ];*/

        return response()->json([$result, $message ], 200);
    }
    public function sendError( $errorMessage , $code=404 )
    {
        $response = [
            'msg'=> 'An error was occurred' ,
            'errors'=>  $errorMessage
        ];
        return response()->json($response , $code );
    }}

