// include "postRequest.js"

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
function setErrorMessage(msg){
	$("#signUpError").text(msg);
	 $("#signUpError").fadeIn().delay(500).fadeOut();
}
function callbackFunction(){
	$("#signUpError").text(msg);
	 $("#signUpError").fadeIn().delay(500).fadeOut();
	 delay(500);
	window.location.assign('pages/profile_page.html');
}
function signUp() {
	    // alert("signed up");
	    var email = $("#emailSignUpField").val();
	    var password = $("#passwordSignUpField").val();
	    if(email !== "" && password!== ""){
	    	// window.location.assign('pages/profile_page.html');
	    	// postRequest("./php/php/signup.php",{email:email,name})
	    	postRequest("./php/php/api/signup.php",{"email":email, "password":password},callbackFunction,setErrorMessage);
	    }
	    else{
	    	$("#signUpError").text("Please fill in empty fields");
	    	$("#signUpError").fadeIn().delay(500).fadeOut();
	    }
           
	};
function postRequest(url,params,callback_function,callback_error){
	// $.post(url, params, "application/json; charset=UTF-8")
 //  		.done(function( data ) {
 //    		alert( "Data Loaded: " + data );
 //    		if(data.success===1)
 //    			callback_success();
 //    		else if(data.success===0)
 //    			callback_error();
 //  		});
 $.ajax({
    url:url,
    method:'POST',
    contentType: "application/json; charset=UTF-8",
    data: params,
    dataType:'json',
    
    success:function(data){
          console.log(data);
          if (data.hasOwnProperty('success') && data.success === 0){
                setErrorMessage(data.message);
            }
            else{
              
              callbackFunction(data.message);
              
            }          
          },

    error: function(xhr, desc, err) {
        console.log(xhr);
        console.log("Details: " + desc + "\nError:" + err);
      }
    });
}
