<?php

namespace App\Http\Controllers;

use App\Registration;
use App\City;
use App\State;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests\RegistrationRequest;
use Datatables;

class RegistrationController extends Controller
{

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(RegistrationRequest $request)
    {
        $user_data = $request->all();
        $user_data['password'] =  bcrypt($request->password);
        Registration::create($user_data);
        return response()->json([
            'status' => 'success',
            'message' => 'registration successfully'
        ]);
    }


    public function update(Request $request, Registration $Registration,$id)
    {
        $user_data = Registration::find($id);
        $all = $request->all();
        $user_data->first_name = $all['first_name'];
        $user_data->last_name = $all['last_name'];
        $user_data->email = $all['email'];
        $user_data->save();
        return response()->json([
            'status' => 'success',
            'message' => 'record updated successfully'
        ]);
    }

    public function destroy(Registration $registration,$id)
    {
        $registration = Registration::find($id);
        $registration->delete();
        return response()->json([
            'status' => 'success',
            'message' => 'record deleted successfully'
        ]);
    }

    public function usersData(Request $request)
    {
        $users = Registration::all();
        return Datatables::of($users)->make(true);
    }
}
