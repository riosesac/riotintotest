<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserAkun extends Model
{
    protected $table = "user_akuns";
    protected $fillable = [
        'namaDepan', 'namaBelakang', 'ttl', 'gender', 'membership'
    ];
}
