<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class med extends JsonResource
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
            'name' =>  $this->name,
            'sell_price'=> $this->sell_price,
            'category'=> $this->category->name,
            'scientific_material'=> $this->scientific_material->name,
            'company'=> $this->company->name,
            'barcode_number'=> $this->barcode_number,

        ];
    }
}
