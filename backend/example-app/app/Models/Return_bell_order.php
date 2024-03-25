<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Return_bell_order extends Model
{
    use HasFactory;
    protected $fillable = [
        'date',
        'total_return_price',
        'sell_bell_order_id',
        'user_id',
        'pharmacy_id'
    ];
    public function sell_bell_order()
    {
        return $this->belongsTo(Sell_bell_order::class , 'sell_bell_order_id');

    }

    public function user()
    {
        return $this->belongsTo(User::class , 'user_id');
    }

    public function return_item_order()
    {
        return $this->hasMany(Return_item_order::class);
    }




}
