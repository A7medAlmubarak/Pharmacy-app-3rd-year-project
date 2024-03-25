<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class buybill extends JsonResource
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
            'total_buy_price'=> $this->total_buy_price,
            'distributor'=> $this->distributor->name,
        ];

    }
}
