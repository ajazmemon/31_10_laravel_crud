$(document).ready(function() {

    // $.noConflict();
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var society_name = 'Committee Member List';
    var date = new Date();
    var day = date.getDate();
    var month = months[date.getMonth()];
    var year = date.getFullYear();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();

    oTable = $('#data_table').DataTable({
        "processing": true,
        "serverSide": true,
        "ordering": false,
        "lengthMenu": [[10, 25, 50, 100, 500], [10, 25, 50, 100, 500]],
        "ajax": "blog_data",
        "columns": [
            // {data: 'DT_Row_Index', orderable: false, searchable: false},
            {data: 'id', name: 'id'},
            {data: 'first_name', name: 'first_name'},
            {data: 'last_name', name: 'last_name', searchable: true},
            {data: 'email', name: 'email', searchable: true},
            {data: 'gender', name: 'gender', searchable: true},
        ],
        "dom": '<"row"<"col-sm-4"l><"col-sm-4"B><"col-sm-4"f>>tip',
        buttons: [
            {
                extend: 'pdf',
                text: '<span class="fa fa-file-pdf-o"></span> PDF',
                filename: 'Category',
                title: 'Title',
                pageSize: 'LEGAL',
                exportOptions: {
                    columns: [0, 1, 2, 3]

                },
                customize: function(doc) {

                    doc.content[1].table.widths = ['25%', '25%', '25%', '25%'];
                    doc.defaultStyle.alignment = 'left';
                    doc.styles.tableHeader.alignment = 'left';
                    //Remove the title created by datatTables
                    doc.content.splice(0, 1);
                    //Create a date string that we use in the footer. Format is dd-mm-yyyy
                    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                    var now = new Date();
                    var mm = months[now.getMonth()];
                    var jsDate = now.getDate() + '-' + (mm) + '-' + now.getFullYear();
                    var time = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
                    var hours = date.getHours();
                    var minutes = date.getMinutes();
                    var ampm = hours >= 12 ? 'PM' : 'AM';
                    hours = hours % 12;
                    hours = hours ? hours : 12; // the hour '0' should be '12'
                    minutes = minutes < 10 ? '0' + minutes : minutes;
                    var strTime = hours + ':' + minutes + ' ' + ampm;
                    doc.pageMargins = [20, 60, 20, 20];
                    // Crea
                    doc['header'] = (function() {

                        return {
                            columns: [
                                {
                                    margin: [150, 20, 0, 300],
                                    fontSize: 16,
                                    text: 'Title'
                                },
                                {
                                    margin: [0, 5, 10, 300],
                                    alignment: 'right',
                                    text: [{text: 'Report is generated on: ', italics: true}, {text: jsDate.toString(), italics: true}, {text: ' at ', italics: true}, {text: strTime, italics: true}]
                                }

                            ],
                            //margin: 20
                        }
                    });
                    doc['footer'] = (function(page, pages) {
                        return {
                            columns: [
                                {
                                    margin: [20, 0, 20, 0],
                                    alignment: 'left',
                                    text: ['Report auto generated ']
                                },
                                {
                                    margin: [0, 0, 20, 0],
                                    alignment: 'right',
                                    text: ['Page ', {text: page.toString()}, ' of ', {text: pages.toString()}]
                                }
                            ],
                            //margin: 50

                        }
                    });
                    var objLayout = {};
                    objLayout['hLineWidth'] = function(i) {
                        return .5;
                    };
                    objLayout['vLineWidth'] = function(i) {
                        return .5;
                    };
                    objLayout['hLineColor'] = function(i) {
                        return '#aaa';
                    };
                    objLayout['vLineColor'] = function(i) {
                        return '#aaa';
                    };
                    objLayout['paddingLeft'] = function(i) {
                        return 4;
                    };
                    objLayout['paddingRight'] = function(i) {
                        return 4;
                    };
                    doc.content[0].layout = objLayout;
                }
            },
            {
                extend: 'csvHtml5',
                filename: 'file_name',
                text: '<i class="fa fa-file-text-o"></i> CSV',
                filename:'Category',
                        titleAttr: 'CSV',
                pageSize: 'LEGAL',
                exportOptions: {
                    columns: [0, 1, 2, 3]
                },
            }

        ],
    });

    // $('#data_table tbody').on('click', 'tr', function() {
    //     var data = oTable.row(this).data();
    //     $('#category').val(data.id).trigger("change");
    //     $('#title').val(data.title);
    //     $('#description').text(data.description);
    // });

$('#add_button').click(function(){
    $('#datatable_main_row').addClass('hidden');
    $('#register_form').removeClass('hidden');
});

$(document).on('submit','#form',function(evt){
        evt.preventDefault();
        var formData = $("#form").serialize();
         $.post({
           url: $("#form").attr('action'),
           type:'POST',
           data:formData,
           dataType: 'json',
           sucess:function(res){
            console.log('hi');
               oTable.draw();
               $('#data_table').ajax.reload();
           },
           error: function (request, status, error) {
        console.log('hi',request.responseText);
    }
        });
    });

$('#data_table tbody').on('click', 'tr', function() {
        $('#register_form').removeClass('hidden');
        $('#password_main').addClass('hidden');
        $('#password').removeAttr('required');
        $('#password-confirm').removeAttr('required');
        $('#password').removeAttr('data-parsley-equalto');

        var data = oTable.row(this).data();
        console.log(data);
        $('#form').attr('action','update/'+data.id);
        $('#first_name').val(data.first_name);
        $('#last_name').val(data.last_name);
        $('#email').val(data.email);
        $('#country').val(data.country).trigger('change');
        $('#state').val(data.state).trigger('change');
        $('#city').val(data.city).trigger('change');
        if(data.gender == "male"){
            console.log(data.gender);
            $("#male").attr('checked', 'checked');

        }else{
            $("#female").attr('checked', 'checked');
        }
    });

$('#create_button').click(function(){
    $('#form').trigger("reset");
    $('#form').attr('action','store');
    $('#password_main').removeClass('hidden');
    $('#password').attr('required');
    $('#password-confirm').attr('required');
    $('#password').attr('data-parsley-equalto');
    $('#register_form').removeClass('hidden');
});
$('#reset_button').click(function(){
    $('#register_form').removeClass('hidden');
    $('#form').trigger("reset");
});

});
