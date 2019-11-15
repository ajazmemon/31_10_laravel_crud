@extends('layouts.admin')
@section('title','Category')
@section('style')
{!! Html::style('bower_components/DataTables/media/css/dataTables.bootstrap.min.css') !!}
{!! Html::style('bower_components/DataTables/media/css/responsive.bootstrap.min.css') !!}
{!! Html::style('https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css') !!}
{!! Html::style('css/mystyle.css') !!}
@endsection
@section('content')
<!-- <div class="d-flex justify-content-end">
    <button id="add_button" type="button" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"></i> Add Vehicle</button>
</div> -->
<div class="row">
<div class="col-md-12">
<div id="datatable_main_row">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">Users</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group mr-2">
                <!-- <button class="btn btn-sm btn-outline-secondary">Share</button>
                <button class="btn btn-sm btn-outline-secondary">Export</button> -->
                <!-- <a class="btn btn-sm btn-outline-secondary" id="add_button">Add New</a> -->
                <button id="add_button" type="button" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"></i> Add Vehicle</button>
            </div>
            <!-- <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                <span data-feather="calendar"></span>
                This week
            </button> -->
        </div>
    </div>
    <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="all-department">
                    <div class="panel panel-white">
                        <!-- <div class="panel-heading">
                            <h5 class="panel-title">ALL DEPARTMENTS</h5>
                        </div> -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered dt-responsive nowrap" id="data_table" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Sr No</th>
                                        <!-- <th>Id</th> -->
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<div class="col-md-12">
        <div class="container">
    <div id="register_form" class="hidden">
        <h2>Registration Form</h2>
        {{ Form::open(array('route' => 'store','data-parsley-validate','id' => "form")) }}
        <div class="form-group">
          <label for="email">First name:</label>
          <input type="text" class="form-control" id="first_name" placeholder="Enter first name" name="first_name" required>
          @if ($errors->has('first_name'))
          <div class="error" style="color: red">{{ $errors->first('first_name') }}</div>
          @endif
        </div>
        <div class="form-group">
          <label for="email">Last name:</label>
          <input type="text" class="form-control" id="last_name" placeholder="Enter first name" required name="last_name">
          @if ($errors->has('last_name'))
          <div class="error" style="color: red">{{ $errors->first('last_name') }}</div>
          @endif
        </div>
        <div class="form-group">
          <label for="pwd">Email:</label>
          <input type="email" class="form-control" placeholder="Enter email" required name="email" id="email">
          @if ($errors->has('email'))
          <div class="error" style="color: red">{{ $errors->first('email') }}</div>
          @endif
        </div>
        <div id="password_main">
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input id="password" type="password" class="form-control" placeholder="Enter password" required name="password" data-parsley-equalto="#password-confirm">
          @if ($errors->has('password'))
          <div class="error" style="color: red">{{ $errors->first('password') }}</div>
          @endif
        </div>
        <div class="form-group">
          <label for="pwd">Confirm Password:</label>
            <input id="password-confirm" type="password" class="form-control" name="password_confirmation">
          @if ($errors->has('password_confirmation'))
          <div class="error" style="color: red">{{ $errors->first('password_confirmation') }}</div>
          @endif
        </div>
      </div>
        <div class="form-group">
          <label for="pwd">Gender:</label>
                {!! Form::radio('gender', 'male',1,array('id'=>'male')) !!}Male
        {!! Form::radio('gender', 'female','',array('id'=>'female')) !!}  Female
            </div>
        @if ($errors->has('gender'))
          <div class="error" style="color: red">{{ $errors->first('gender') }}</div>
          @endif
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="button" class="btn btn-danger" id="reset_button">Reset</button>
          {{ Form::close() }}
    </div>
        </div>
</div>
</div>
@endsection
@section('script')
{{ Html::script('bower_components/DataTables/media/js/jquery.dataTables.min.js') }}
<!--{{ Html::script('bower_components/DataTables/media/js/dataTables.bootstrap.min.js') }}-->
{{ Html::script('bower_components/DataTables/datatables.min.js') }}
{{ Html::script('https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js') }}
{{ Html::script('bower_components/jszip/dist/jszip.min.js') }}
{{ Html::script('bower_components/pdfmake.min.js') }}
{{ Html::script('https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js') }}
{{ Html::script('https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js') }}
{{ Html::script('https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js') }}
<!-- {!! Html::script('js/ajax.js') !!} -->
{!! Html::script('js/parsley.min.js') !!}
{!! Html::script('js/blog/blog.js') !!}
@endsection
