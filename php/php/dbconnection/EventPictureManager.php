<?php
require_once 'constants.php';
require_once __ENTITIES__."EventPicture.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventPictureManager
 * @author admin
 */
class EventPictureManager {
    
    public function insertEventPicture($event_picture){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO event_has_picture (event, picture) "
                . "VALUES(?, ?);");
        $event_id = $event_picture->getEvent();
        $picture_id = $event_picture->getPicture();
        $sql_insert->bind_params("ii", $event_id, $picture_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteEventPicture($event_picture) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM event_has_picture "
                . "WHERE event_id = ? AND picture_id = ?;");
        $event_id = $event_picture->getEvent();
        $picture_id = $event_picture->getPicture();
        $sql_delete->bind_params("ii", $event_id, $picture_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllPicturesForEvent($event){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT P.id, P.file_location "
                . "FROM picture P INNER JOIN event_has_picture EP "
                . "ON EP.picture_id = P.id   "
                . "WHERE EP.event_id = ?;");
        $event_id = $event->getId();
        $sql_select->bind_param("i", $event_id);
        $result = PictureManager::fetchPictures();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
}
