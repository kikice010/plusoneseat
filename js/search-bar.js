$(function () {
    $('#sb-input-group-datepicker').datetimepicker({ 
        format: 'MM/DD/YYYY',
        debug: true
    });

    if (typeof $.p1s === 'undefined') {
        $.p1s = {};
    }
    if (typeof $.p1s.datepicker === 'undefined') {
        $.p1s.datepicker = {};
        $.p1s.datepicker.first_click_month = true;
    }
});

$(document).keydown(function(event){
    if(event.which=="17")
         $.p1s.datepicker.ctrl = true;
});

$(document).keyup(function(event){
    if(event.which=="17")
         $.p1s.datepicker.ctrl = false;
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
        debug: true,
        useCurrent: false
    });
    $('#sb-input-group-timepicker').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true
    });

    $('#sb-input-group-timepicker-start').on("dp.change", function (e) {
        var start = $('#sb-input-group-timepicker-start').data("DateTimePicker");
        var end = $('#sb-input-group-timepicker-end').data("DateTimePicker");
        end.minDate(e.date);
    });
    $('#sb-input-group-timepicker-end').on("dp.change", function (e) {
        var start = $('#sb-input-group-timepicker-start').data("DateTimePicker");
        var end = $('#sb-input-group-timepicker-end').data("DateTimePicker");
        start.maxDate(e.date);
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
        $('#sb-input-group-datepicker>.dropdown-menu .day.active').removeClass("active");

        if($('#sb-input-group-datepicker>.dropdown-menu>.list-unstyled>li>.calendar-button').length === 0) {
            var selection_buttons = "<li><div class='calendar-button' id='sb-datepicker-clear'>Clear selection</div><div class='calendar-button' id='sb-datepicker-select'>Select</div></li>";
            $('#sb-input-group-datepicker>.dropdown-menu>.list-unstyled').append(selection_buttons);
        }

        $('#sb-datepicker-select').click(function() {

        });

        $('#sb-datepicker-clear').click(function() {
            $('#sb-input-group-datepicker>.dropdown-menu .selected').removeClass("selected");
        });

        
            $('#sb-input-group-datepicker>.dropdown-menu .day').click(day_click);
        

        $(".bootstrap-datetimepicker-widget .month").click(function(e){
            if($.p1s.datepicker.first_click_month) {
                $.p1s.datepicker.first_click_month = false;
                $(this).click();
                $(".bootstrap-datetimepicker-widget .month.active").removeClass("active");
                $(this).addClass("active");
                e.stopPropagation();
                $('#sb-input-group-datepicker>.dropdown-menu .day').click(day_click);
                $.p1s.datepicker.first_click_month = true;
            } 
        });
    });

    function day_click(e) {
        var classList = $(this).attr('class');
        if(classList.indexOf("selected") != -1) {
            $(this).removeClass("selected");
            $(this).blur();
        } else {
            $(this).addClass("selected");
        }                
        e.stopPropagation();
    }

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