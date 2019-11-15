var oTable;
$(document).ready(function(){
$.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});
// oTable = $('#data_table').DataTable({
//                 "ajax": {
//                     "url": "/users-data",
//                     "type": "POST",
//                     "datatype": "json"
//                 },
//                 "columns" : [
//                         {data: 'id', name: 'id'},
//                         {data: 'first_name', name: 'first_name'},
//                         {data: 'last_name', name: 'last_name', searchable: true},
//                         {data: 'email', name: 'email', searchable: true},
//                     ]
//             });

$('#country').change(function() {
        var countryId = $(this).val();
        if (countryId!=0)
        {
            $.ajax({
                type: 'GET',
                url: "get-state-list?country_id=" + countryId,
                success: function(res) {
                    $('#state').empty();
                    $('#state').append('<option>Select State</option>');
                    $.each(res, function(key, value) {
                        $('#state').append('<option  value="' + key + '">' + value + '</option>');
                    });
                }
            });
        }
        else
        {
            $('#state').empty();
            $('#city').empty();
        }
    });
$('#state').change(function() {
        var stateId = $(this).val();
        if (stateId!="Select State")
        {
            $.ajax({
                type: 'GET',
                url: "get-city-list?state_id=" + stateId,
                success: function(res) {

                        $('#city').empty();
                        $.each(res, function(key, value) {
                            $('#city').append('<option  value="' + key + '">' + value + '</option>');
                        });

                }
            });
        }
        else
        {
            $('#city').empty();
        }
    });
// $(document).on('submit','#form',function(evt){
//         evt.preventDefault();
//         var formData = $("#form").serialize();
//          $.post({
//            url: $("#form").attr('action'),
//            type:'POST',
//            data:formData,
//            dataType: 'json',
//            sucess:function(res){
//             console.log('hi');
//                oTable.draw();
//                $('#data_table').ajax.reload();
//            },
//            error: function (request, status, error) {
//         console.log('hi',request.responseText);
//     }
//         });
//     });
//
// $('#data_table tbody').on('click', 'tr', function() {
//         $('#register_form').removeClass('hidden');
//         $('#password_main').addClass('hidden');
//         $('#password').removeAttr('required');
//         $('#password-confirm').removeAttr('required');
//         $('#password').removeAttr('data-parsley-equalto');
//
//         var data = oTable.row(this).data();
//         console.log(data);
//         $('#form').attr('action','update/'+data.id);
//         $('#first_name').val(data.first_name);
//         $('#last_name').val(data.last_name);
//         $('#email').val(data.email);
//         $('#country').val(data.country).trigger('change');
//         $('#state').val(data.state).trigger('change');
//         $('#city').val(data.city).trigger('change');
//         if(data.gender == "male"){
//             console.log(data.gender);
//             $("#male").attr('checked', 'checked');
//
//         }else{
//             $("#female").attr('checked', 'checked');
//         }
//     });
//
// $('#create_button').click(function(){
//     $('#form').trigger("reset");
//     $('#form').attr('action','store');
//     $('#password_main').removeClass('hidden');
//     $('#password').attr('required');
//     $('#password-confirm').attr('required');
//     $('#password').attr('data-parsley-equalto');
//     $('#register_form').removeClass('hidden');
// });
// $('#reset_button').click(function(){
//     $('#register_form').removeClass('hidden');
//     $('#form').trigger("reset");
// });
});
