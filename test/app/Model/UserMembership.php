<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserMembership extends Model
{
    protected $table = "user_memberships";
    protected $fillable = [
        'tipe', 'harga'
    ];
}
