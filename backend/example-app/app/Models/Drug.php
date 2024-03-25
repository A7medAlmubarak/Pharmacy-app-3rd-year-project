<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Drug extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'sell_price',
        'category_id',
        'scientific_material_id',
        'company_id',
        'barcode_number'

    ];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id' );
    }
    public function scientific_material()
    {
        return $this->belongsTo(ScientificMaterial::class, 'scientific_material_id' );
    }
    public function company()
    {
        return $this->belongsTo(Company::class, 'company_id' );
    }

    public function batch()
    {
        return $this->hasMany(Batch::class);
    }




}
