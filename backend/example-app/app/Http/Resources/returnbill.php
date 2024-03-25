<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class returnbill extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        return [
            'id' =>  $this->id,
            'date' =>  $this->date,
            'updated_total_price'=> $this->sell_bell_order->total_sell_price - $this->total_return_price,
            'total_return_price'=>  $this->total_return_price,
            'user'=> $this->user->name,
        ];


    }
}
