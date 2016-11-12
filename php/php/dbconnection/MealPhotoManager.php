<?php
require_once 'constants.php';
require_once __ENTITIES__."MealPhoto.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class MealPhotoManager {
    
    public static function insertMealPhoto($meal_photo){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO meal_photos (id_meal_offer, photo) "
                . "VALUES(?, ?);");
        $id_meal_offer = $meal_photo->getIdMealOffer();
        $photo = $meal_photo->getPhoto();
        $sql_insert->bind_param("is", $id_meal_offer, $photo);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteMealPhoto($meal_photo) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM meal_photos "
                . "WHERE id = ?;");
        $id = $meal_photo->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllPhotosForMealOffer($meal_offer) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM meal_photos WHERE id_meal_offer = ?;");
        $id_meal_offer = $meal_offer->getId();
        $sql_select->bind_param("i", $id_meal_offer);
        $result = MealPhotoManager::fetchPhotos();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchPhotos(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $id_meal_offer = null;
        $photo = null;
        $tupple = null;
        $statement->bind_result($id, $id_meal_offer, $photo);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new MealPhoto($id, $id_meal_offer, $photo);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
