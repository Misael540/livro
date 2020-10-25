<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/login', function () {
    return view('site.login');

})->name('site.login');

Route::get('/', function () {
    return view('site.login');

})->name('site.login');

Route::get('/menu', function () {
    return view('site.menu');

})->name('site.menu');

Route::get('/data', function () {
    return view('site.database');

})->name('site.database');