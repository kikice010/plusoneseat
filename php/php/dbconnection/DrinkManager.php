<?php
require_once 'constants.php';
require_once __ENTITIES__."Drink.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class DrinkManager {
    public static function getDrinkByName($name) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id "
                . "FROM drink WHERE name LIKE ?;");
        $sql_select->bind_param("s", $name);
         $statement = $db_instance->getStatement();

         $result = array();
        $id = null;
        $statement->bind_result($id);

        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){

           
            array_push($result, $id);
        }
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        echo json_encode($result[0]);
        return $result[0];

    }
    
    public static function getAllDrinks() {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM drink;");
        $result = DrinkManager::fetchDrinks();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchDrinks(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $alcoholic = null;
        $tupple = null;
        $statement->bind_result($id, $name, $alcoholic);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Drink($id, $name, $alcoholic);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
