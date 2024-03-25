<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sell_bell_order extends Model
{
    use HasFactory;
    protected $fillable = [
        'date',
        'total_sell_price',
        'user_id',
        'pharmacy_id'
    ];
    public function user()
    {
        return $this->belongsTo(User::class , 'user_id');
    }
    public function sell_item_order()
    {
        return $this->hasMany(Sell_item_order::class);
    }

    public function Return_bill_order()
    {
        return $this->hasOne(Return_bell_order::class);
    }



}
