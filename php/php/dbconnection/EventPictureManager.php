<?php
require_once 'constants.php';
require_once __ENTITIES__."EventPicture.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventPictureManager
 * @author admin
 */
class EventPictureManager {
    
    function __construct(){
    }

    function __destruct(){
    }
    
    public function insertEventPicture($event_picture){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO event_has_picture (event, picture) "
                . "VALUES(?, ?);");
        $sql_insert->bind_params("ii", $event_picture->getEvent(), $event_picture->getPicture());
        $sql_insert->execute();
        $db_instance->disconnect();
    }
    
    public function deleteCourseTag($event_picture) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM event_has_picture "
                . "WHERE event = ? AND picture = ?;");
        $sql_delete->bind_params("ii", $event_picture->getEvent(), $event_picture->getPicture());
        $sql_delete->execute();
        $db_instance->disconnect();
    }
}
