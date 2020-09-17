<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Service\Model;
use App\Http\Controllers\Service\Pesan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class Register extends Controller
{
    private $model;
    public $pesan;
    public $akun;
    public $alamat;
    public $cc;
    public $member;
    public $login;
    function __construct()
    {
        $this->model = new Model;
        $this->pesan = new Pesan;
        $this->akun = $this->model->UserAkun;
        $this->alamat = $this->model->UserAlamat;
        $this->cc = $this->model->UserCreditCard;
        $this->member = $this->model->UserMembership;
        $this->login = $this->model->Login;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $nilai = $request->all();
        $val = Validator::make($nilai, [
            'namaBelakang' => 'required',
            'ttl' => 'required',
            'gender' => 'required',
            'email' => 'required',
            'password' => 'required',
            'member' => 'required',
            'number' => 'required',
            'expired' => 'required',
            'tipe' => 'required',
            'alamat' => 'required',
        ]);
        if ($val->fails()) {
            return response()->json([
                'error' => $val->errors(),
                'code' => $this->pesan->Error()
            ], $this->pesan->Error()['code']);
        }
        $members = $this->member->where(['tipe' => $nilai['member']])->first();
        if (!$members->id) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data member tidak ada',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        if ($this->akun->where([
            'namaDepan' => $nilai['namaDepan'],
            'namaBelakang' => $nilai['namaBelakang'],
            'ttl' => $nilai['ttl'],
            'gender' => $nilai['gender'],
            'membership' => $members->id
        ])->first()) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data akun sudah ada',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }

        $akun = $this->akun->create([
            'namaDepan' => $nilai['namaDepan'],
            'namaBelakang' => $nilai['namaBelakang'],
            'ttl' => $nilai['ttl'],
            'gender' => $nilai['gender'],
            'membership' => $members->id
        ]);
        if (!$akun->id) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data biodata tidak ada',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        if ($this->cc->where([
            'user' => $akun->id,
            'number' => $nilai['number'],
            'tipe' => $nilai['tipe'],
            'expired' => $nilai['expired']
        ])->first()) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data cc sudah ada',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        $cc = $this->cc->create([
            'user' => $akun->id,
            'number' => $nilai['number'],
            'tipe' => $nilai['tipe'],
            'expired' => $nilai['expired']
        ]);
        if (!$cc->id) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data CC tidak ada',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        $alamat = $this->alamat->create([
            'user' => $akun->id,
            'alamat' => $nilai['alamat']
        ]);
        if (!$alamat->id) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data alamat tidak ada',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        if ($this->login->where([
            'user' => $akun->id,
            'email' => $nilai['email'],
            'password' => $nilai['password']
        ])->first()) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data user sudah terdaftar',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        if ($nilai['password'] == $nilai['password_current']) {
            # code...
            $this->login->create([
                'user' => $akun->id,
                'email' => $nilai['email'],
                'password' => $nilai['password']
            ]);
        }
        return response()->json([
            'status' => true,
            'pesan' => 'data teregistrasi !!!',
            'code' => $this->pesan->Sukses()
        ], $this->pesan->Sukses()['code']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
