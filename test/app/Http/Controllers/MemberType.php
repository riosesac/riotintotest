<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Service\Model;
use App\Http\Controllers\Service\Pesan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MemberType extends Controller
{
    private $model;
    public $member;
    public $pesan;

    function __construct()
    {
        $this->model = new Model;
        $this->member = $this->model->UserMembership;
        $this->pesan = new Pesan;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = $this->member->get();
        if (!$data) {
            return response()->json([
                'status' => false,
                'data' => 'data tidak ada',
                'code' => $this->pesan->Error()['code']
            ], $this->pesan->Error()['code']);
        }
        return response()->json([
            'status' => true,
            'data' => collect($data)->map(function ($value) {
                return [
                    'nama' => $value->tipe,
                    'harga' => $value->harga,
                ];
            }),
            'code' => $this->pesan->Sukses()['code']
        ], $this->pesan->Sukses()['code']);
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
            'nama' => 'required',
            'harga' => 'required'
        ]);
        if ($val->fails()) {
            return response()->json([
                'error' => $val->errors(),
                'code' => $this->pesan->Error()
            ], $this->pesan->Error()['code']);
        }
        if ($this->member->where([
            'tipe' => $nilai['nama'],
            'harga' => $nilai['harga']
        ])->first()) {
            # code...
            return response()->json([
                'status' => false,
                'pesan' => 'data member sudah ada',
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        $data = $this->member->create([
            'tipe' => $nilai['nama'],
            'harga' => $nilai['harga']
        ]);

        if (!$data) {
            return response()->json([
                'status' => false,
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        return response()->json([
            'status' => true,
            'pesan' => 'data ditambahkan !!!',
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
        $nilai = $request->all();
        $val = Validator::make($nilai, [
            'nama' => 'required',
            'harga' => 'required'
        ]);
        if ($val->fails()) {
            return response()->json([
                'error' => $val->errors(),
                'code' => $this->pesan->Error()
            ], $this->pesan->Error()['code']);
        }
        $liat = $this->member->where(['id' => $id])->first();
        if (!$liat->id) {
            # code...
            $data = null;
        }
        $data = $this->member->where(['id' => $liat->id])->update([
            'tipe' => $nilai['nama'],
            'harga' => $nilai['harga']
        ]);

        if (!$data) {
            return response()->json([
                'status' => false,
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        return response()->json([
            'status' => true,
            'pesan' => 'data diperbaharui !!!',
            'code' => $this->pesan->Sukses()
        ], $this->pesan->Sukses()['code']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = $this->member->where(['id' => $id])->delete();
        if (!$data) {
            return response()->json([
                'status' => false,
                'code' => $this->pesan->Gagal()
            ], $this->pesan->Gagal()['code']);
        }
        return response()->json([
            'status' => true,
            'pesan' => 'data dihapus !!!',
            'code' => $this->pesan->Sukses()
        ], $this->pesan->Sukses()['code']);
    }
}
