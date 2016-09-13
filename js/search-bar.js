$(function () {
    $('#sb-input-group-datepicker').datetimepicker({ 
        format: 'MM/DD/YYYY',
        debug: true
    });
});

$(function () {
    $('#sb-input-group-timepicker').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true
    });
});

$(function () {
    $('body').click(function() {
        $('#sb-input-group-datepicker').data("DateTimePicker").hide();
        $('#sb-input-group-timepicker').data("DateTimePicker").hide();
    });

    $("#sb-input-group-datepicker").click(function(e){
        e.stopPropagation();
    });

    $('#sb-input-group-datepicker').find('.bootstrap-datetimepicker-widget').click(function(e){
        e.stopPropagation();
        $('#sb-input-group-datepicker').data("DateTimePicker").show();
    });

    $('#sb-input-group-datepicker').find('.sb-input').click(function(e){
        $('#sb-input-group-datepicker').data("DateTimePicker").toggle();
    });

    $("#sb-input-group-timepicker").click(function(e){
        e.stopPropagation();
    });

    $('#sb-input-group-timepicker').find('.bootstrap-datetimepicker-widget').click(function(e){
        e.stopPropagation();
        $('#sb-input-group-timepicker').data("DateTimePicker").show();
    });

    $('#sb-input-group-timepicker').find('.sb-input').click(function(e){
        $('#sb-input-group-timepicker').data("DateTimePicker").toggle();
    });
});