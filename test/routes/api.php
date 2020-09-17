<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::match(['get', 'post'], '/user/member', 'MemberType@index');
Route::match(['get', 'post'], '/user/member/create', 'MemberType@store');
Route::match(['get', 'post'], '/user/member/edit/{id}', 'MemberType@update');
Route::match(['get', 'post'], '/user/member/delete/{id}', 'MemberType@destroy');


Route::match(['get', 'post'], '/user/register/create', 'Register@store');
