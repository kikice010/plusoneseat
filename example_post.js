postRequest("./php/php/api/updateProfile.php",{"json":JSON.stringify({"id":1,"firstname":"Milica","lastname":"Jovanovic","email":"kikice010@gmail.com","password":"kikice","country":"Italy","city":"Milano","description":"Bella ragazza :P","gender":"Female","birthday":"2014-07-01","birth_location":"Pirot, Serbia","user_education":[{"id_user":1,"university":"Politecnico di Torino","degree":"Master"}],"user_work":[{"id_user":1,"job":"Software Developer","city":"Torino","country":"Italy"}],"user_interests":[{"id":3,"interest":"Science"},{"id":2,"interest":"Music"}],"user_languages":[{"language":"Fiji","level":"Basic"}],"user_phonenumbers":[{"id_user":1,"nicename":"Afghanistan","country_code":93,"number":"55555555"},{"id_user":1,"nicename":"Afghanistan","country_code":93,"number":"333"}]})},callbackFunction,setErrorMessage); 

postRequest("./php/php/api/createMeal.php",{"json":JSON.stringify({"type" : "Breakfast","name": "Firts meal","description" : "Some description of the meal","seats" : {"min" : "1","max" : "3"},"cuisine" : {"continent" : "Asia","country" : "Japan"},"drinks": ["Wine","Water"],"course_option" : "Starter/Desert | Main Course","courses" : [{"type" : "Starter","dishes" : [{"dish_name" : "Salad","dish_type" : "Vegetables","main_dish" : false,"ingredients" : "cucumber, tomato, oil"},{"dish_name" : "Bruschetti","dish_type" : "Vegetables","main_dish" : false,"ingredients" : "cucumber, tomato, oil, bread"}]},{"type" : "Main","dishes" : [{"dish_name" : "Sarma","dish_type" : "Red Meat","main_dish" : true,"ingredients" : "cabage, meat"},{"dish_name" : "Soup","dish_type" : "Vegetables","main_dish" : true,"ingredients" : "tomato, oil, bread crumbs"}]}],"photos" : ['base64string', 'base64string'],	"price" : {"seat" : 10,5,"currency" : "euro","donations" : 2,"type" : "orange"},"date" : "15/05/2017","start_time" : "21:20","end_time" : "23:20"})},callbackFunction,setErrorMessage); 

{
	host: 1,
	type : "Breakfast",
	name : "Firts meal",
	description : "Some description of the meal",
	seats : {
		min : "1",
		max : "3"
	}
	cuisine : {
		continent : "Asia",
		country : "Japan"
	},
	drinks: ["Wine","Water"]
	course_option : "Starter/Desert | Main Course",
	courses : [
		{
			type : "Starter",
			dishes : [{
				dish_name : "Salad",
				dish_type : "Vegetables"
				main_dish : false,
				ingredients : "cucumber, tomato, oil"
			},
			{
				dish_name : "Bruschetti",
				dish_type : "Vegetables"
				main_dish : false,
				ingredients : "cucumber, tomato, oil, bread"
			}
				]
		},
		{
			type : "Main",
			dishes : [{
				dish_name : "Sarma",
				dish_type : "Red Meat"
				main_dish : true,
				ingredients : "cabage, meat"
			},
			{
				dish_name : "Soup",
				dish_type : "Vegetables"
				main_dish : true,
				ingredients : "tomato, oil, bread crumbs"
			}
				]
			
		}
	],
	photos : ['base64string', 'base64string'],
	price : {
		seat : "10,5",
		curency : "euro" //for now always euro,
		donations : "2",
		type : "orange"
	},
	date : "15/05/2017",
	start_time : "21:20",
	end_time : "23:20"
}