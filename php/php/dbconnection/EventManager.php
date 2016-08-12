<?php
require_once 'constants.php';
require_once __ENTITIES__."Event.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventManager
 * @author mcolic
 */
class EventManager {
    public static function insertEvent($event){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO event (description, location, host, time, menu, price) "
                . "VALUES(?, ?, ?, ?, ?, ?);");
        $description = $event->getDescription();
        $location = $event->getLocation();
        $host = $event->getHost();
        $time = $event->getTime();
        $menu = $event->getMenu();
        $price = $event->getPrice();
        $sql_insert->bind_params("siisid", $description, $location, $host, $time, $menu, $price);
        $db_instance->executeStatement();
        $db_instance->disconnect();
    }
    
    public static function deleteEvent($event) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM event "
                . "WHERE id = ?;");
        $id = $event->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function getAllEventsForLocation($location) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, description, location, host, time, menu, price "
                . "FROM event WHERE location = ?;");
        $location_id = $location->getId();
        $sql_select->bind_params("i", $location_id);
        $result = EventManager::fetchEvents();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public function getAllEventsForHost($host) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, description, location, host, time, menu, price "
                . "FROM event WHERE host = ?;");
        $user_id = $host->getId();
        $sql_select->bind_params("i", $user_id);
        $result = EventManager::fetchEvents();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public function getAllEventsForPrice($price) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, description, location, host, time, menu, price "
                . "FROM event WHERE price <= ? ORDER BY price ASC;");
        $sql_select->bind_params("i", $price);
        $result = EventManager::fetchEvents();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public function getAllEventsWhereAttending($user) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT E.id, E.description, E.location, E.host, E.time, E.menu, E.price "
                . "FROM event E INNER JOIN guest G"
                . "ON G.event = E.id"
                . "WHERE G.guest = ?;");
        $user_id = $user->getId();
        $sql_select->bind_params("i", $user_id);
        $result = EventManager::fetchEvents();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchEvents(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $description = null;
        $location = null;
        $host = null;
        $time = null;
        $menu = null;
        $price = null;
        $statement->bind_result($id, $description, $location, $host, $time, $menu, $price);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Comment($id, $description, $location, $host, $time, $menu, $price);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
