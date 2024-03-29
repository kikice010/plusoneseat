<?php
require_once 'constants.php';
require_once __ENTITIES__."Tag.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class TagManager {
    
    public static function insertTag($tag){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO tag (name, description) "
                . "VALUES(?, ?);");
        $name = $tag->getName();
        $description = $tag->getDescription();
        $sql_insert->bind_param("ss", $name, $description);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteCourseTag($tag) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM tag "
                . "WHERE course_id = ? AND tag_id = ?;");
        $id = $tag->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function fetchTags(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $description = null;
        $tupple = null;
        $statement->bind_result($id, $name, $description);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Tag($id, $name, $description);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
