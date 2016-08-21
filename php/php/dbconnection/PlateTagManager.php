<?php
require_once 'constants.php';
require_once __ENTITIES__."PlateTag.php";
require_once __DB_CONNECTION__."TagManager.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseTagManager
 * @author admin
 */
class PlateTagManager {
    
    public static function insertPlateTag($plate_tag){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO course_has_tag (plate_id, tag_id) "
                . "VALUES(?, ?);");
        $plate = $plate_tag->getCourse();
        $tag = $plate_tag->getTag();
        $sql_insert->bind_param("ii", $plate, $tag);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deletePlateTag($plate_tag) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM plate_has_tag "
                . "WHERE plate_id = ? AND tag_id = ?;");
        $plate = $plate_tag->getCourse();
        $tag = $plate_tag->getTag();
        $sql_delete->bind_param("ii", $plate, $tag);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllTagsForPlate($plate){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT T.id, T.name, T.description "
                . "FROM plate_has_tag PT INNER JOIN tag T "
                . "ON PT.tag_id = T.id   "
                . "WHERE PT.plate_id = ?;");
        $plate_id = $plate->getId();
        $sql_select->bind_param("i", $plate_id);
        $result = TagManager::fetchTags();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
}
