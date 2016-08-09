<?php
require_once 'constants.php';
require_once __ENTITIES__."CourseTag.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseTagManager
 * @author admin
 */
class CourseTagManager {
    
    function __construct(){
    }

    function __destruct(){
    }
    
    public function insertCourseTag($course_tag){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO course_has_tag (course_id, tag_id) "
                . "VALUES(?, ?);");
        $course = $course_tag->getCourse();
        $tag = $course_tag->getTag();
        $sql_insert->bind_param("ii", $course, $tag);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteCourseTag($course_tag) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM course_has_tag "
                . "WHERE course_id = ? AND tag_id = ?;");
        $course = $course_tag->getCourse();
        $tag = $course_tag->getTag();
        $sql_delete->bind_param("ii", $course, $tag);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function getAllTagsForCourse($course){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT T.name, T.description "
                . "FROM course_has_tag CT INNER JOIN tag T "
                . "ON CT.tag_id = T.id   "
                . "WHERE CT.course_id = ?;");
        $course_id = $course->getId();
        $sql_select->bind_param("i", $course_id);
        $name = null;
        $description = null;
        $sql_select->bind_result($name, $description);
        $db_instance->executeStatement();
        
        
        while($db_instance->fetchResult()){
            echo $name . " ; " . $description;
            echo "<br>";
        }
        
        $db_instance->closeConnection();
        
        
        //return $result;
    }
}
