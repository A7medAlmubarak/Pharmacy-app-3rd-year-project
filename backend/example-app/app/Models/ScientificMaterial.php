<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ScientificMaterial extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
    ];
    
    public function drug()
    {
        return $this->hasMany(Drug::class);
    }

}
