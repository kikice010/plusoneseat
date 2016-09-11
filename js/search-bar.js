$(function () {
    $('#sb-input-group-datepicker').datetimepicker({ 
        format: 'MM/dd/YYYY',
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