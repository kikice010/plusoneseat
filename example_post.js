postRequest("./php/php/api/updateProfile.php",{"json":JSON.stringify({"id":1,"firstname":"Milica","lastname":"Jovanovic","email":"kikice010@gmail.com","password":"kikice","country":"Italy","city":"Milano","description":"Bella ragazza :P","gender":"Female","birthday":"2014-07-01","birth_location":"Pirot, Serbia","user_education":[{"id_user":1,"university":"Politecnico di Milano","degree":"Master"},{"id_user":1,"university":"University of Electronics","degree":"Bachelor"}],"user_work":[{"id_user":1,"job":"Software Developer","city":"Milan","country":"Italy"}],"user_interests":[{"id":1,"interest":"Sports"},{"id":2,"interest":"Music"}],"user_languages":[{"language":"Fiji","level":"Basic"}],"user_phonenumbers":[{"id_user":1,"nicename":"Afghanistan","country_code":93,"number":"55555555"},{"id_user":1,"nicename":"Afghanistan","country_code":93,"number":"11111111"}]})},callbackFunction,setErrorMessage); 
