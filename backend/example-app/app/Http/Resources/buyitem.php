<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class buyitem extends JsonResource
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
            'batch_id' =>  $this->batch_id,
            'med' =>  $this->batch->drug->name,
            'buy_item_quantity'=> $this->buy_item_quantity,
            'buy_bill_order_id'=> $this->buy_bill_order_id,
            'buy_item_price'=> $this->buy_item_price,
        ];

    }
}
