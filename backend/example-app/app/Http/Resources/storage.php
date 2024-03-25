<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class storage extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
       // return parent::toArray($request);

       return [
        'id' =>  $this->drug->id,
        'name' =>  $this->drug->name,
        'storage_quantity'=> $this->storage_quantity,
        'sell_price'=>  $this->drug->sell_price,
        'barcode_number'=>  $this->drug->barcode_number,

    ];
    }
}
