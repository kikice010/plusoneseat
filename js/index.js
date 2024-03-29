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
	    // postRequest("./php/php/api/createMeal.php",{"json":JSON.stringify({"host": 1,"type" : "Dinner","name": "Second meal","description" : "Some description of the meal","seats" : {"min" : "5","max" : "3"},"cuisine" : {"continent" : "Asia","country" : "Japan"},"drinks": ["Wine"],"course_option" : "Starter/Desert | Main Course","courses" : [{"type" : "Starter","dishes" : [{"dish_name" : "Salad","dish_type" : "Vegetables","main_dish" : false,"ingredients" : "cucumber, tomato, oil"},{"dish_name" : "Bruschetti","dish_type" : "Vegetables","main_dish" : false,"ingredients" : "cucumber, tomato, oil, bread"}]},{"type" : "Main","dishes" : [{"dish_name" : "Sarma","dish_type" : "Red Meat","main_dish" : true,"ingredients" : "cabage, meat"},{"dish_name" : "Soup","dish_type" : "Vegetables","main_dish" : true,"ingredients" : "tomato, oil, bread crumbs"}]}],"photos" : ['base64string', 'base64string'],	"price" : {"seat" : 10.5,"currency" : "euro","donations" : 2,"type" : "orange"},"date" : "15/05/2017","start_time" : "21:20","end_time" : "23:20"})},callbackFunction,setErrorMessage); 
	    postRequest("./php/php/api/createMeal.php",{"json":JSON.stringify({"type":"4","name":"Graduation celebration","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque justo libero, varius tristique nisl egestas, mattis venenatis mi. ","seats":{"min":"1","max":"3"},"cuisine":{"continent":"Europe","country":"Italy"},"course_option":"Starter | Main Course | Desert","courses":[{"type":"Starter","dishes":[{"dish_type":"Vegetables","dish_name":"Apetizers","main_dish":false,"ingredients":"Zucchine, Egg plants, carrots"},{"dish_type":"Vegetables","dish_name":"Cheese","main_dish":false,"ingredients":"goat, cow cheese"}]},{"type":"Main","dishes":[{"dish_type":"Red Meat","dish_name":"Sarma","main_dish":false,"ingredients":"minced meat, onion, rice, dry peppers"}]},{"type":"Desert","dishes":[{"dish_type":"Red Meat","dish_name":"Cheese cake","main_dish":false,"ingredients":"mascarpone, biscuits"}]},{"type":"Custom","dishes":[]}],"photos":[],"price":{"seat":"10","donation":"orange","currency":"euro"},"date":"30/12/2016","start_time":"13:30","end_time":"17:45","host":1})},callbackFunction,setErrorMessage); 

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
