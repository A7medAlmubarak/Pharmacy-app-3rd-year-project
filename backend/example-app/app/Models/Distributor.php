<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Distributor extends Model
{
    use HasFactory , SoftDeletes;
    protected $fillable = [
        'name',
        'admin_id',
        'location_id',
        'phone',
        'email'
        ];
    protected $dates = ['deleted_at'];

        public function location()
        {
            return $this->belongsTo(Location::class, 'location_id' );
        }

        public function user()
        {
            return $this->belongsTo(User::class, 'admin_id' );
        }

        public function batch()
        {
            return $this->hasMany(Batch::class);
        }
        public function buy_bill_order()
        {
            return $this->hasMany(Buy_bill_order::class);
        }
       




}
