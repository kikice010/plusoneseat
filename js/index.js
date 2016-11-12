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
	    // var email = $("#emailfield").val();
	    // var password = $("#passwordfield").val();
	    // if(email !== "" && password!== ""){ 	
	    // 	postrequest("./php/php/api/login.php",{'email':email, 'password':password},callbackfunction,seterrormessage);

	    // }
	    // else{
	    // 	$(".labelerror").text("please fill in empty fields");
	    // 	$(".labelerror").fadein().delay(500).fadeout();
	    // }     
	    postRequest("./php/php/api/createMeal.php",{"json":JSON.stringify({"type" : "Breakfast","name": "Firts meal","description" : "Some description of the meal","seats" : {"min" : "1","max" : "3"},"cuisine" : {"continent" : "Asia","country" : "Japan"},"drinks": ["Wine","Water"],"course_option" : "Starter/Desert | Main Course","courses" : [{"type" : "Starter","dishes" : [{"dish_name" : "Salad","dish_type" : "Vegetables","main_dish" : false,"ingredients" : "cucumber, tomato, oil"},{"dish_name" : "Bruschetti","dish_type" : "Vegetables","main_dish" : false,"ingredients" : "cucumber, tomato, oil, bread"}]},{"type" : "Main","dishes" : [{"dish_name" : "Sarma","dish_type" : "Red Meat","main_dish" : true,"ingredients" : "cabage, meat"},{"dish_name" : "Soup","dish_type" : "Vegetables","main_dish" : true,"ingredients" : "tomato, oil, bread crumbs"}]}],"photos" : ['base64string', 'base64string'],	"price" : {"seat" : 10.5,"currency" : "euro","donations" : 2,"type" : "orange"},"date" : "15/05/2017","start_time" : "21:20","end_time" : "23:20"})},callbackFunction,setErrorMessage); 

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
