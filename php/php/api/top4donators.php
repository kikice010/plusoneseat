<?php
require_once 'constants.php';
require __SWIFT_MAILER__;
require_once __ENTITIES__.'MealOffer.php';
require_once __ENTITIES__.'User.php';
require_once __ENTITIES__.'UserPicture.php';
require_once __DB_CONNECTION__.'MealOfferManager.php';
require_once __DB_CONNECTION__.'UserManager.php';
require_once __DB_CONNECTION__.'UserPictureManager.php';

require_once __DB_CONNECTION__.'MealPhotoManager.php';


$method = filter_input(INPUT_SERVER, "REQUEST_METHOD");


    $result = array();

    $res = MealOfferManager::getTop4HostIds();
    foreach ($res as $tupple){
        $row = null;

        $user = UserManager::getUser($tupple["host_id"]);
        $row["id"] = $user->getId();
        $row["firstname"] = $user->getName();
        $row["lastname"] = $user->getSurname();
        $row["donations"] = (int)$tupple["num"];
        $row["description"] = $user->getDescription();
       
        $row["meal_picture"] = 
        
        $pictures = UserPictureManager::getAllPicturesForUser($user);
        if(!empty($pictures))
           $row["user_picture"] = $pictures;
        else
           $row["user_picture"] = "no photo";
       
        $meal_offers = MealOfferManager::getMealOffersByHost($user->getId());
        $first_meal = $meal_offers[0];
        $meal_photo = MealPhotoManager::getAllPhotosForMealOffer($first_meal->getId());

        if(!empty($meal_photo))
            $row["meal_picture"] = $meal_photo[0]->getPhoto();
        else
            $row["meal_picture"] = "no photos";

        array_push($result, $row);
    }  

    echo json_encode($result);



?>