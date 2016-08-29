$("#subscribeForm").on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        formError();
        submitMSG(false, "Did you fill in the form properly?");
    } else {
        // everything looks good!
        event.preventDefault();
        submitForm();
    }
});


function submitForm(){
    // Initiate Variables With Form Content
    var email = $("#email").val();

    $.ajax({
        type: "POST",
        url: "../php/php/api/subscribe.php",
        data: "email=" + email,
        success : function(text){
            if (text == "success"){
                formSuccess();
            } else {
                formError();
                submitMSG(false,text);
            }
        }
    });
}

function formSuccess(){
    $("#subscribeForm")[0].reset();
    submitMSG(true, "Message Submitted!")
}

function formError(){
    
}

function submitMSG(valid, msg){
    if(valid){
        var msgClasses = "h3 text-center tada animated text-success";
    } else {
        var msgClasses = "h3 text-center text-danger";
    }
    //$("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
}