$(document).ready(function() {
    $(".past-offer").click(function(event) {
        $("#current-past-offer").val("#"+this.id);
        $("#current-past-offer-hide").val("no");
        $("#"+this.id).find(".tabs").show();
    });

    $("html").click(function() {
        if($("#current-past-offer-hide").val() === "yes") {
            $($("#current-past-offer").val()).find(".tabs").hide();
        }
        $("#current-past-offer-hide").val("yes");       
    });
});