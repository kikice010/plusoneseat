<?php
require_once 'constants.php';
require_once __ENTITIES__."Course.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class CourseManager {
    
    public static function insertCourse($course){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO course (name, description, menu) "
                . "VALUES(?, ?, ?);");
        $name = $course->getName();
        $description = $course->getDescription();
        $menu = $course->getMenu();
        $sql_insert->bind_params("ssi", $name, $description, $menu);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteCourse($course) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM course "
                . "WHERE id = ?;");
        $id = $course->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllCoursesForMenu($menu) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, name, description, menu "
                . "FROM course WHERE menu = ?;");
        $menu_id = $menu->getId();
        $sql_select->bind_params("i", $menu_id);
        $result = CourseManager::fetchCourses();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchCourses(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $description = null;
        $menu_id = null;
        $tupple = null;
        $statement->bind_result($id, $name, $description, $menu_id);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Course($id, $name, $description, $menu_id);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
