<?php
require_once 'constants.php';
require_once __ENTITIES__."Guest.php";
require_once __DB_CONNECTION__."DBManager.php";
/**
 * Description of GuestManager
 * @author admin
 */
class GuestManager {
    
    public function insertGuest($guest){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO guest (event, user, status) "
                . "VALUES(?, ?, ?);");
        $event_id = $guest->getEvent();
        $user_id = $guest->getUser();
        $status = $guest->getStatus();
        $sql_insert->bind_params("iii", $event_id, $user_id, $status);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteGuest($guest) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM guest "
                . "WHERE event = ? AND user = ?;");
        $event_id = $guest->getEvent();
        $user_id = $guest->getUser();
        $sql_delete->bind_params("ii", $event_id, $user_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function getAllGuestsForEvent($event){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        //to see for the pic weather to do 2 more joins or separate query 
        $sql_select = $db_instance->prepare("SELECT U.name, U.surname "
                . "FROM guest G INNER JOIN user U "
                . "ON G.user = U.id   "
                . "WHERE G.event = ?;");
        $event_id = $event->getId();
        $sql_select->bind_params("i", $event_id);
        $result = UserManager::fetchUsers();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
}
