<?php
require_once 'constants.php';
require_once __ENTITIES__."Menu.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class MenuManager {
    
    public static function insertMenu($menu){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO menu (name, description, course_number) "
                . "VALUES(?, ?, ?);");
        $name = $menu->getName();
        $description = $menu->getDescription();
        $course_number = $menu->getCourseNumber();
        $sql_insert->bind_params("ssi", $name, $description, $course_number);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteMenu($menu) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM menu "
                . "WHERE id = ?;");
        $id = $menu->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getMenuById($id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, name, description, course_number "
                . "FROM menu WHERE id = ?;");
        $sql_select->bind_params("i", $id);
        $result = CourseManager::fetchCourses();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchMenus(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $description = null;
        $course_number = null;
        $tupple = null;
        $statement->bind_result($id, $name, $description, $course_number);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Course($id, $name, $description, $course_number);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
