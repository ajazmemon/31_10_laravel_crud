<?php

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/blog', 'BlogController@index')->name('blog');
Route::get('/blog_data', 'BlogController@data')->name('blog_data');

Route::post('/update/{update}', 'RegistrationController@update')->name('update');
Route::get('/delete/{delete}', 'RegistrationController@destroy')->name('delete');
Route::post('/store', 'RegistrationController@store')->name('store');
Route::post('users-data','RegistrationController@usersData')->name('users-data');
