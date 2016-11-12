<?php
require_once 'constants.php';
require_once __ENTITIES__."Dish.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class DishManager {
    
    public static function insertDish($dish){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO dish (id_course, id_dish_type, ingredients,main_dish,dish_name) "
                . "VALUES(?, ?, ?,?, ?);");

        $id_course = $dish->getIdCourse();
        $id_dish_type = $dish->getMealIdDishType();
        $ingredients = $dish->getIngredients();
        $main_dish = $dish->getMainDish();
        $dish_name = $dish->getDishName();
        echo json_encode($id_course);
        $sql_insert->bind_param("iisis", $id_course[0], $id_dish_type, $ingredients, $main_dish, $dish_name);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteDish($dish) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM dish "
                . "WHERE id = ?;");
        $id = $dish->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    //not finished!
    public static function getDishById($id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM dish WHERE id = ?;");
        $sql_select->bind_param("i", $id);
        $result = fetchCourses();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        //echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchDish(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        $id = null;
        $id_course = null;
        $id_dish_type = null;
        $ingredients = null;
        $main_dish = null;
        $dish_name = null;
        $tupple = null;
        $statement->bind_result($id ,$id_course, $id_dish_type, $ingredients, $main_dish, $dish_name);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Dish($id ,$id_course, $id_dish_type, $ingredients, $main_dish, $dish_name);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
