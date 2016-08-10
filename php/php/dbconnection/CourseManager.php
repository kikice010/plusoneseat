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
        $sql_insert->bind_params("ssi", $course->getName(),
                $course->getDescription(), $course->getMenu());
        $sql_insert->execute();
        $db_instance->disconnect();
    }
    
    public static function getAllCoursesForMenu($menu) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * FROM course WHERE menu = ?;");
        $sql_select->bind_params("i", $menu->getId());
        $result = null;
        $sql_select->bind_result($result);
        $sql_select->execute();
        $sql_select->fetch();
        $db_instance->disconnect();
        
        return $result;
    }
}
