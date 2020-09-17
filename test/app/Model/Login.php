<?php

namespace App\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Login extends Authenticatable
{
    use Notifiable;

    protected $table = "logins";
    protected $fillable = [
        'user', 'email', 'password'
    ];
}
