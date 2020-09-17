<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserCreditCard extends Model
{
    protected $table = "user_credit_cards";
    protected $fillable = [
        'user', 'number', 'tipe', 'expired'
    ];
}
