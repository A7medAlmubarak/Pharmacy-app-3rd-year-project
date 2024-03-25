<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Batch extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'batch_quantity',
        'expired_date',
        'date_of_entry',
        'pharmacy_id',
        'drug_id'
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function drug()
    {
        return $this->belongsTo(Drug::class, 'drug_id' );
    }

    public function distributor()
    {
        return $this->belongsTo(Distributor::class, 'distributor_id');
    }

    public function buy_item_order()
    {
        return $this->hasMany(Buy_item_order::class);
    }

    public function sell_item_order()
    {
        return $this->hasMany(Sell_item_order::class);
    }

    public function return_item_order()
    {
        return $this->hasMany(Return_item_order::class);
    }





}
