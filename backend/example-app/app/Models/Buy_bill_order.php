<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Buy_bill_order extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'admin_id',
        'total_buy_price',
        'pharmacy_id',
        'distributor_id'

    ];

    public function buy_item_order()
    {
        return $this->hasMany(Buy_item_order::class);
    }

    public function distributor()
    {
        return $this->belongsTo(Distributor::class, 'distributor_id' );
    }

}
