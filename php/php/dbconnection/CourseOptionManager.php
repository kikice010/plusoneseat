<?php
require_once 'constants.php';
require_once __ENTITIES__."CourseOption.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class CourseOptionManager {
    public static function getCourseOptionById($id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();

        $result = array();
        $name = null;

        $sql_select = $db_instance->prepare("SELECT course_option "
                . "FROM course_option WHERE id = ?;");
        $sql_select->bind_param("i", $id);
       
        $statement = $db_instance->getStatement();
        $statement->bind_result($name);

        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){

           
            array_push($result, $name);
        }
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result[0];
    }

    public static function getCourseOptionByName($name) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();

        $result = array();
        $id = null;

        $sql_select = $db_instance->prepare("SELECT id "
                . "FROM course_option WHERE course_option LIKE ?;");
        $sql_select->bind_param("s", $name);
       
        $statement = $db_instance->getStatement();
        $statement->bind_result($id);

        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){

           
            array_push($result, $id);
        }
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result[0];
    }
    
    public static function getAllCourseOptions() {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM course_option;");
        $result = CourseOptionManager::fetchCourseOptions();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchCourseOptions(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $statement->bind_result($id, $name);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new CourseOption($id, $name);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
