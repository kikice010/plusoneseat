$(function () {
    $('#sb-input-group-datepicker').datetimepicker({ 
        format: 'MM/DD/YYYY',
        debug: true
    });
});

$(function () {
    $('#sb-input-group-timepicker-start').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true
    });
    $('#sb-input-group-timepicker-end').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true
    });
    $('#sb-input-group-timepicker').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true
    });
});

$(function () {
    $('body').click(function() {
        $('#sb-input-group-datepicker').data("DateTimePicker").hide();
        $('#sb-input-group-timepicker-start').data("DateTimePicker").hide();
        $('#sb-input-group-timepicker-end').data("DateTimePicker").hide();
        if($("#ignore_body_click").val()==="1" || $("#ignore_body_click").val()==="3") {
            $("#sb-dropdown-navigation").hide();
            $('#sb-menu-button').removeClass('sb-menu-button-active');
        } else {
            $("#ignore_body_click").val("1");
        }
    });

    $("#sb-dd-nav-ul").click(function(e) {
        if($("#ignore_body_click").val()!=="3") {
            $("#ignore_body_click").val("2");
        }
    });

    $(".menu-pills").click(function(e){
        $("#ignore_body_click").val("3");
    });

    $("#sb-menu-button").click(function(e) {
        e.stopPropagation();
        $('#sb-menu-button').addClass('sb-menu-button-active');
        $("#sb-dropdown-navigation").show();
    });

    $("#sb-input-group-datepicker").click(function(e){
        e.stopPropagation();
        $('#sb-input-group-timepicker-start').data("DateTimePicker").hide();
        $('#sb-input-group-timepicker-end').data("DateTimePicker").hide();
    });

    $('#sb-input-group-datepicker').find('.bootstrap-datetimepicker-widget').click(function(e){
        e.stopPropagation();
        $('#sb-input-group-datepicker').data("DateTimePicker").show();
    });

    $('#sb-input-group-datepicker').find('.sb-input').click(function(e){
        $('#sb-input-group-datepicker').data("DateTimePicker").toggle();
    });

    $("#sb-input-group-timepicker-start").click(function(e){
        e.stopPropagation();
        $("#sb-input-group-timepicker-end").data("DateTimePicker").hide();
        $('#sb-input-group-datepicker').data("DateTimePicker").hide();
    });

    $('#sb-input-group-timepicker-start').find('.bootstrap-datetimepicker-widget').click(function(e){
        e.stopPropagation();
        $('#sb-input-group-timepicker-start').data("DateTimePicker").show();
    });

    $('#sb-input-group-timepicker-start').find('.sb-input').click(function(e){
        $('#sb-input-group-timepicker-start').data("DateTimePicker").toggle();
    });

     $("#sb-input-group-timepicker-end").click(function(e){
        e.stopPropagation();
        $("#sb-input-group-timepicker-start").data("DateTimePicker").hide();
        $('#sb-input-group-datepicker').data("DateTimePicker").hide();
    });

    $('#sb-input-group-timepicker-end').find('.bootstrap-datetimepicker-widget').click(function(e){
        e.stopPropagation();
        $('#sb-input-group-timepicker-end').data("DateTimePicker").show();
    });

    $('#sb-input-group-timepicker-end').find('.sb-input').click(function(e){
        $('#sb-input-group-timepicker-end').data("DateTimePicker").toggle();
    });
});