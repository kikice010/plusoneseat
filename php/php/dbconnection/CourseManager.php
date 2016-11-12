<?php
require_once 'constants.php';
require_once __ENTITIES__."Course.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class CourseManager {
    
    public static function insertCourse($id_meal_offer,$course_type){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO course (id_meal_offer, course_type) "
                . "VALUES(?, ?);");
        $sql_insert->bind_param("is", $id_meal_offer, $course_type);
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

    public static function getCourseId($id_meal_offer,$course_type) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id "
                . "FROM course WHERE id_meal_offer = ? AND course_type LIKE ?;");
        $sql_select->bind_param("is", $id_meal_offer,$course_type);
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
    
    public static function getAllCoursesForMealOffer($meal_offer) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM course WHERE id_meal_offer = ?;");
        $id_meal_offer = $meal_offer->getId();
        $sql_select->bind_param("i", $id_meal_offer);
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
        $id_meal_offer = null;
        $course_type = null;
        $tupple = null;
        $statement->bind_result($id, $id_meal_offer, $course_type);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Course($id, $id_meal_offer, $course_type);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
