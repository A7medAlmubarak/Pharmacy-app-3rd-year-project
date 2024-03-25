<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Buy_item_order extends Model
{
    use HasFactory;
    protected $fillable = [
        'batch_id',
        'buy_item_quantity',
        'buy_bill_order_id',
        'buy_item_price'
    ];

    public function buy_bill_order()
    {
        return $this->belongsTo(Buy_bill_order::class, 'buy_bill_order_id' );
    }

    public function batch()
    {
        return $this->belongsTo(Batch::class, 'batch_id' );
    }



}
