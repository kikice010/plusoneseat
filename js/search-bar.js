$(function () {
    $('#datepicker').datetimepicker({ 
        format: 'MM/dd/YYYY'
    });
});

$(function () {
    $('#timepicker').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true
    });
});