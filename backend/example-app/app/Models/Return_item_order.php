<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Return_item_order extends Model
{
    use HasFactory;
    protected $fillable = [
        'return_item_quantity',
        'return_bell_order_id',
        'return_item_price',
        'batch_id',
        'sell_bell_order_id'
    ];
    public function return_bell_order()
    {
        return $this->belongsTo(Return_bell_order::class , 'return_bell_order_id');
    }
  


    public function storage_item()
    {
        return $this->belongsTo(Storage::class , 'storage_item_id');
    }

    public function batch()
    {
        return $this->belongsTo(Batch::class, 'batch_id' );
    }







}
