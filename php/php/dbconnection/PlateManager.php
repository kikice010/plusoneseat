<?php
require_once 'constants.php';
require_once __ENTITIES__."Plate.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class MenuManager {
    
    public static function insertPlate($plate){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO plate (name, description, course) "
                . "VALUES(?, ?, ?);");
        $name = $plate->getName();
        $description = $plate->getDescription();
        $course = $plate->getCourseNumber();
        $sql_insert->bind_params("ssi", $name, $description, $course);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deletePlate($plate) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM plate "
                . "WHERE id = ?;");
        $id = $plate->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllPlatesForCourse($course) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, name, description, course "
                . "FROM plate WHERE course = ?;");
        $course_id = $course->getId();
        $sql_select->bind_params("i", $course_id);
        $result = CourseManager::fetchCourses();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchPlates(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $description = null;
        $course = null;
        $tupple = null;
        $statement->bind_result($id, $name, $description, $course);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Course($id, $name, $description, $course);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
