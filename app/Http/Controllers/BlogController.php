<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Registration;
use Datatables;

class BlogController extends Controller
{
    public function index(){
    	return view('blog.index');
    }

    public function data()
    {
        // $user = User::all();
        // return Datatables::of($user)->addIndexColumn()->make(true);
        $users = Registration::all();
        return Datatables::of($users)->make(true);
    }
}
