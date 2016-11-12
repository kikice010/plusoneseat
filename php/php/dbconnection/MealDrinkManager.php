<?php
require_once 'constants.php';
require_once __ENTITIES__."Drink.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class MealDrinkManager {
    
    public static function insertMealDrink($meal_drink){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO meal_drinks (id_meal_offer,id_drink) "
                . "VALUES(?, ?);");

        $id_meal_offer = $meal_drink->getIdMealOffer();
        $id_drink = $meal_drink->getDrink();
        
        $sql_insert->bind_param("ii", $id_meal_offer, $id_drink);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteMealDrink($meal_drink) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM meal_drinks "
                . "WHERE id = ?;");
        $id = $meal_drink->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }

    public static function getMealDrinkByIdMealOffer($meal_drink) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM meal_drinks WHERE id_meal_offer = ?;");
        $sql_select->bind_param("i", $meal_drink);
        $result = MealDrinkManager::fetchDrinks();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        //echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchDrinks(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        $id = null;
        $id_meal_offer = null;
        $id_drink = null;
        $tupple = null;
        $statement->bind_result($id ,$id_meal_offer, $id_drink);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new MealDrink($id ,$id_meal_offer, $id_drink);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
