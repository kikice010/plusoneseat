function postRequest(url,params,callback_function,callback_error){

	$.ajax({
	    url:url,
	    type:'POST',
	    data: params,
	    dataType: 'json',
	    success:function(data){
	        console.log(data);
	        if (data.hasOwnProperty('success') && data.success === 0){
	            callback_error(data.message);
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