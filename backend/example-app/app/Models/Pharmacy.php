<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pharmacy extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'warning_status'

    ];

    public function user()
    {
        return $this->hasMany(User::class);
    }

    public function income()
    {
        return $this->hasMany(Income::class);
    }

    public function location()
    {
        return $this->belongsTo(Location::class , 'location_id');

    }

}
