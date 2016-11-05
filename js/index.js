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

	$("#locationInput").placepicker();

	$('#dateInput').datetimepicker({ 
        format: 'MM/DD/YYYY',
        debug: true
    });

});

$(document).click(function(e) { 
    var ele = $(e.toElement); 
    if (!ele.hasClass("datepickerInput") && !ele.hasClass("datepicker"))
       $('#dateInput').data("DateTimePicker").hide();
});


function setErrorMessage(msg){
	$(".labelError").text(msg);
	 $(".labelError").fadeIn().delay(500).fadeOut();
}
function callbackFunction(msg){
	$(".labelError").text(msg);
	 $(".labelError").fadeIn().delay(500).fadeOut();
	setTimeout(window.location.assign('pages/profile_page.html'),1500);
}
function signUp() {
	    // alert("signed up");
	    var email = $("#emailSignUpField").val();
	    var password = $("#passwordSignUpField").val();
	    if(email !== "" && password!== ""){ 	
	    	postRequest("./php/php/api/signup.php",{'email':email, 'password':password},callbackFunction,setErrorMessage);

	    }
	    else{
	    	$(".labelError").text("Please fill in empty fields");
	    	$(".labelError").fadeIn().delay(500).fadeOut();
	    }        
	};

function logIn() {
	    // alert("signed up");
	    // var email = $("#emailField").val();
	    // var password = $("#passwordField").val();
	    // if(email !== "" && password!== ""){ 	
	    // 	postRequest("./php/php/api/login.php",{'email':email, 'password':password},callbackFunction,setErrorMessage);

	    // }
	    // else{
	    // 	$(".labelError").text("Please fill in empty fields");
	    // 	$(".labelError").fadeIn().delay(500).fadeOut();
	    // }     
	    postRequest("./php/php/api/updateProfile.php",{"json":JSON.stringify({"id":1,"firstname":"Milica","lastname":"Jovanovic","email":"kikice010@gmail.com","password":"kikice","country":"Italy","city":"Milano","description":"Bella ragazza :P","gender":"Female","birthday":"2014-07-01","birth_location":"Pirot, Serbia","user_education":[{"id_user":1,"university":"Politecnico di Torino","degree":"Master"}],"user_work":[{"id_user":1,"job":"Software Developer","city":"Torino","country":"Italy"}],"user_interests":[{"id":3,"interest":"Science"},{"id":2,"interest":"Music"}],"user_languages":[{"language":"Fiji","level":"Basic"}],"user_phonenumbers":[{"id_user":1,"nicename":"Afghanistan","country_code":93,"number":"55555555"},{"id_user":1,"nicename":"Afghanistan","country_code":93,"number":"333"}]})},callbackFunction,setErrorMessage); 
   
	};


function postRequest(url,params,callback_function,callback_error){

 $.ajax({
    url:url,
    type:'POST',
    data: params,
    dataType: 'json',
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
