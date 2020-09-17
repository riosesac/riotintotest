<?php

namespace App\Http\Controllers\Service;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class Pesan extends Controller
{
    public function Sukses()
    {
        return [
            'code' => 200,
            'detail' => 'data sukses'
        ];
    }

    public function Error()
    {
        return [
            'code' => 404,
            'detail' => 'data tidak ditemukan'
        ];
    }

    public function Gagal()
    {
        return [
            'code' => 406,
            'detail' => 'data gagal'
        ];
    }
}
