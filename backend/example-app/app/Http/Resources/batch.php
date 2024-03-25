<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class batch extends JsonResource
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
        'id' =>  $this->id,
        'batch_quantity' =>  $this->batch_quantity,
        'expired_date'=> $this->expired_date,

    ];

    }
}
