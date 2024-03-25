<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class sellitem extends JsonResource
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
        'batch_id' =>  $this->batch_id,
        'med' =>  $this->batch->drug->name,
        'sell_item_quantity'=> $this->sell_item_quantity,
        'sell_item_price'=> $this->sell_item_price,
    ];
    }
}
