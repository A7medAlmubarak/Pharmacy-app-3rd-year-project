<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
    ];

    public function distributor()
    {
        return $this->hasMany(Distributor::class);
    }

    public function user()
    {
        return $this->hasMany(User::class);
    }

    public function pharmacy()
    {
        return $this->hasMany(Pharmacy::class);
    }
}
