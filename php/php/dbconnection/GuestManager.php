<?php
require_once 'constants.php';
require_once __ENTITIES__."Guest.php";
require_once __DB_CONNECTION__."DBManager.php";
/**
 * Description of GuestManager
 * @author admin
 */
class GuestManager {
     function __construct(){
    }

    function __destruct(){
    }
    
    public function insertGuest($guest){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO guest (event, user, status) "
                . "VALUES(?, ?, ?);");
        $sql_insert->bind_params("iii", $guest->getEvent(), $guest->getUser(), $guest->getStatus());
        $sql_insert->execute();
        $db_instance->disconnect();
    }
    
    public function deleteGuest($guest) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM guest "
                . "WHERE event = ? AND user = ?;");
        $sql_delete->bind_params("ii", $guest->getEvent(), $guest->getUser());
        $sql_delete->execute();
        $db_instance->disconnect();
    }
    
    public function getAllGuestsForEvent($event){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        //to see for the pic weather to do 2 more joins or separate query 
        $sql_select = $db_instance->prepare("SELECT U.name, U.surname "
                . "FROM guest G INNER JOIN user U "
                . "ON G.user = U.id   "
                . "WHERE G.event = ?;");
        $sql_select->bind_params("i", $event->getId());
        $result = null;
        $sql_select->bind_result($result);
        $sql_select->execute();
        $sql_select->fetch();
        $db_instance->disconnect();
        
        return $result;
    }
}
