<?php
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
    
    //Save mail address in the database
    $id = filter_input(INPUT_POST, "id");
    $res = MealOfferManager::getMealOffersById($id);
    $returned_meal = $res[0];
        $obj = null;
        //echo json_encode($returned_meal);
        $obj['host'] = $returned_meal->host_id;
        $obj['type'] = $returned_meal->meal_type;
        $obj['name'] = $returned_meal->meal_name;
        $obj['description'] = $returned_meal->description;
        $obj['seats']['max'] = $returned_meal->max_seat;
        $obj['seats']['min'] = $returned_meal->min_seat; // has min and max seats
        $continent = ContinentManager::getContinentByCode($returned_meal->continent);
        $obj['cuisine']['continent'] = $continent->name;
        $country = CountryManager::getCountryById($returned_meal->country);
        $obj['cuisine']['country'] = $country;//has continent and country
        $course_option = CourseOptionManager::getCourseOptionById($returned_meal->course_option);
        $obj['course_option'] = $course_option;
        $obj['price']['donation_type'] = $returned_meal->donation_type;
        $obj['price']['currency'] = $returned_meal->currency;
        $obj['price']['number_of_donations'] = $returned_meal->number_of_donations;
        $obj['price']['price'] = $returned_meal->price;
        $obj['date'] = $returned_meal->date;
        $obj['start_time'] = $returned_meal->start_time;
        $obj['end_time'] = $returned_meal->end_time;
        $obj["courses"] = array();

        $courses = CourseManager::getAllCoursesForMealOffer($returned_meal->id);
        //echo json_encode($courses);
        $meal_photo = MealPhotoManager::getAllPhotosForMealOffer($returned_meal->id);
        $obj['photo'] = array();
        foreach ($meal_photo as $value){   
            array_push($obj['photo'], $value->photo);  
        }  
        $meal_drink = MealDrinkManager::getMealDrinkByIdMealOffer($returned_meal->id);
        $obj['drinks'] = array();
        foreach ($meal_drink as $value){   
            $drinks = DrinkManager::getDrinkById($value->id_drink);
            foreach ($drinks as $value){   
                array_push($obj['drinks'], $value->name);  
            }  
           
        }  
        //echo json_encode($courses);
        foreach ($courses as $value){  
            $tupple = null;
            $tupple["type"] = $value->course_type;
            $tupple["dishes"] = array();
            $dishes = DishManager::getDishById($value->id);
            //echo json_encode($tupple);
            foreach ($dishes as $value){   
                $dish_type = DishTypeManager::getDishTypesById($value->id_dish_type);
                //echo json_encode($dish_type);
                $tupple1 = null;
                $tupple1["dish_name"] = $value->dish_name;
                $tupple1["main_dish"] = $value->main_dish;
                $tupple1["ingredients"] = $value->ingredients;
                $tupple1["dish_type"] = $dish_type[0]->name;
                array_push($tupple["dishes"], $tupple1);  
            } 
             array_push($obj['courses'], $tupple); 
            
        }

    echo json_encode($obj);
}


?>