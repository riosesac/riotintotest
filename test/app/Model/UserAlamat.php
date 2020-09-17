<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserAlamat extends Model
{
    protected $table = "user_alamats";
    protected $fillable = [
        'user', 'alamat'
    ];
}
