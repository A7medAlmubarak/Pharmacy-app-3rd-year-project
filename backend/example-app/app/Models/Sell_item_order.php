<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sell_item_order extends Model
{
    use HasFactory;
    protected $fillable = [
        'batch_id',
        'sell_item_quantity',
        'sell_item_price',
        'sell_bell_order_id'
    ];

    public function storage_item()
    {
        return $this->belongsTo(storage::class , 'storage_item_id');
    }

    public function sell_bell_order()
    {
        return $this->belongsTo(Sell_bell_order::class , 'sell_bell_order_id');
    }

    public function batch()
    {
        return $this->belongsTo(Batch::class, 'batch_id' );
    }




}
