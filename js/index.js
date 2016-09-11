$(document).ready(function(){
    $('#signUpBtnEmail').on('click', function(event) {
          $('#signUpEmailInputGroup').slideToggle( 300 );        
    });

    $('#signUpModal').on('hidden.bs.modal', function () {
	  $('#signUpEmailInputGroup').hide();
	});

	$('#logInSignUpModalBtn').on('click', function(event) {
	    $('#logInModal').modal("show");        
	});

	$('#signUpLogInModalButton').on('click', function(event) {
	    $('#signUpModal').modal("show");       
	});

});

function signUp() {
	    // alert("signed up");
	    var email = $("#emailSignUpField").text();
	    var password = $("#passwordSignUpField").text();
	    if(email !== "" && password!== ""){
	    	alert("signed up");
	    }
	    else{
	    	$("#signUpError").text("Please fill in empty fields");
	    	$("#signUpError").fadeIn().delay(500).fadeOut();
	    }
           
	};

