<?php
// Swift Mailer Library
require_once 'constants.php';
require __SWIFT_MAILER__;
require_once __ENTITIES__.'MealOffer.php';
require_once __ENTITIES__.'MealDrink.php';
require_once __ENTITIES__.'Dish.php';
require_once __DB_CONNECTION__.'MealOfferManager.php';
require_once __DB_CONNECTION__.'MealDrinkManager.php';
require_once __DB_CONNECTION__.'MealPhotoManager.php';
require_once __DB_CONNECTION__.'CourseManager.php';
require_once __DB_CONNECTION__.'CourseOptionManager.php';
require_once __DB_CONNECTION__.'DrinkManager.php';
require_once __DB_CONNECTION__.'DishManager.php';
require_once __DB_CONNECTION__.'DishTypeManager.php';
require_once __DB_CONNECTION__.'CountryManager.php';
require_once __DB_CONNECTION__.'ContinentManager.php';

$method = filter_input(INPUT_SERVER, "REQUEST_METHOD");

switch ($method) {
  case 'POST':

    $json = filter_input(INPUT_POST, "json");
    $obj = json_decode($json,true);
    $host_id = $obj['host'];
    $meal_type = $obj['type'];
    $meal_name = $obj['name'];
    $description = $obj['description'];
    $seats = $obj['seats']; // has min and max seats
    $cuisine = $obj['cuisine']; //has continent and country
    $drinks = $obj['drinks'];
    $course_option = $obj['course_option']; 
    $courses = $obj['courses']; //check again
    $photos = $obj['photos'];
    $price = $obj['price']; //complex type, price per seat, currency, number of donations and type of donations
    $date = $obj['date'];
    $start_time = $obj['start_time'];
    $end_time = $obj['end_time'];

    $continent = ContinentManager::getContinentByName($cuisine["continent"]);
    $continent_id = $continent->getId();
    //echo json_encode($continent_id);
    $country = CountryManager::getCountryByName($cuisine["country"]);
    $country_id = $country->getId();
    $course_option_id = CourseOptionManager::getCourseOptionByName($course_option);
    
    $meal_offer = new MealOffer(null,$host_id,$meal_type,$meal_name,$continent_id,$country_id,$description,$seats["min"],$seats["max"],$price["seat"],$date,$start_time,$course_option_id,$end_time,$price["type"],$price["donations"],$price["currency"],$host_id);
  
    //echo json_encode($meal_offer);
    MealOfferManager::insertMealOffer($meal_offer);
    $id_meal_offer = MealOfferManager::getMealOfferId($meal_offer);

    
    foreach ($drinks as $value){
        //echo json_encode($value);
        $drink = DrinkManager::getDrinkByName($value);
        
        $meal_drink = new MealDrink(null, $id_meal_offer, $drink);
        //echo json_encode($meal_drink);
        MealDrinkManager::insertMealDrink($meal_drink);
    }
    foreach ($photos as $value){
        $meal_photo = new MealPhoto(null, $id_meal_offer, $value);
        MealPhotoManager::insertMealPhoto($meal_photo);
    }

    foreach ($courses as $value){  
        CourseManager::insertCourse($id_meal_offer,$value["type"]);
        foreach ($value["dishes"] as $dish){ 
            $id_course = CourseManager::getCourseId($id_meal_offer,$value["type"]);
            $id_dish_type = DishTypeManager::getDishTypeByName($dish["dish_type"]);
            $newDish = new Dish(null,$id_course,$id_dish_type,$dish["ingredients"],$dish["main_dish"],$dish["dish_name"]);
            //echo json_encode($newDish);
            DishManager::insertDish($newDish);
        }
    }
    
}


?>