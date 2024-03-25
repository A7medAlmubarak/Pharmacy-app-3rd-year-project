<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class distributor extends JsonResource
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
        'name' =>  $this->name,
        'admin_id'=> $this->user->id,
        'admin'=> $this->user->name,
        'phone'=> $this->phone,
        'email'=> $this->email,
        'location'=> $this->location->name,

    ];

    }
}
