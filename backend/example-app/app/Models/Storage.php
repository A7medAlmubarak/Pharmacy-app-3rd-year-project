<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Storage extends Model
{
    use HasFactory;
    protected $fillable = [
        'storage_quantity',
        'pharmacy_id',
        'drug_id'
    ];

    public function pharmacy()
    {
        return $this->belongsTo(Pharmacy::class , 'pharmacy_id');
    }

    public function drug()
    {
        return $this->belongsTo(Drug::class , 'drug_id');
    }



}
