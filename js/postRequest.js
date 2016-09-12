function postRequest(url,params,callback_function,callback_error){
	$.post(url, params)
  		.done(function( data ) {
    		alert( "Data Loaded: " + data );
    		if(data.success===1)
    			callback_success();
    		else if(data.success===0)
    			callback_error();
  		});
}