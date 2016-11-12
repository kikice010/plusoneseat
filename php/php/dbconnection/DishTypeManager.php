<?php
require_once 'constants.php';
require_once __ENTITIES__."DishType.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class DishTypeManager {
    public static function getDishTypeByName($name) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id "
                . "FROM dish_type WHERE name LIKE ?;");
        $sql_select->bind_param("s", $name);
        $statement = $db_instance->getStatement();
        
        $id = null;
        $result = array();

        $statement->bind_result($id);

        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            array_push($result, $id);
        }
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        
        return $result;
    }
    
    public static function getAllDishTypes() {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM dish_type;");
        $result = DishTypeManager::fetchDishTypes();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchDishTypes(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $statement->bind_result($id, $name);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new DishType($id, $name);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
