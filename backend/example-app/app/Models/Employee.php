<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'pharmacy_id',
        'date'
    ];
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id' );
    }
    public function pharmacy()
    {
        return $this->belongsTo(Pharmacy::class, 'pharmacy_id' );
    }

}
