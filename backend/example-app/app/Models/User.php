<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'password',
        'rold_id',
        'location_id',
        'pharmacy_id'
    ];
    protected $dates = ['deleted_at'];


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function role()
    {
        return $this->belongsTo(Role::class , 'rold_id');
    }

    public function location()
    {
        return $this->belongsTo(Location::class , 'location_id');
    }
    public function pharmacy()
    {
        return $this->belongsTo(Pharmacy::class , 'pharmacy_id');
    }


    public function sell_bell_order()
    {
        return $this->hasMany(Sell_bell_order::class);
    }

    public function return_bell_order()
    {
        return $this->hasMany(Return_bell_order::class);
    }

    public function distributor()
    {
        return $this->hasMany(Distributor::class);
    }

    public function batch()
    {
        return $this->hasMany(Batch::class);
    }

    public function employee()
    {
        return $this->hasOne(Employee::class);
    }





}
