<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class returnitem extends JsonResource
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
        //'batch_id' =>  $this->batch_id,
        'med' =>  $this->batch->drug->name,
        'return_item_quantity'=> $this->return_item_quantity,
        'return_item_price'=> $this->return_item_price,
    ];

    }
}
