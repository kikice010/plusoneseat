<?php
require_once 'constants.php';
require_once __ENTITIES__."Comment.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of LocationManager
 * @author mcolic
 */
class LocationManager {
    
    public static function insertLocation($location){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO location (latitude, longitude, address) "
                . "VALUES(?, ?, ?);");
        $latitude = $location->getLatitude();
        $longitude = $location->getLongitude();
        $address = $location->getAddress();
        $sql_insert->bind_params("dds", $latitude, $longitude, $address);
        $db_instance->executeStatement();
        $db_instance->disconnect();
    }
    
    public static function deleteLocation($location) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM location "
                . "WHERE id = ?;");
        $id = $location->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getLocationById($id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, latitude, longitude, address "
                . "FROM location WHERE id = ?;");
        $sql_select->bind_params("i", $id);
        $result = LocationManager::fetchLocations();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function checkIfLocationExists($location) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, latitude, longitude, address "
                . "FROM location WHERE id = ?;");
        $location_id = $location->getId();
        $latitude = $location-getLatitude();
        $longitude = $location->getLongitude();
        $address = $location->getAddress();
        $sql_select->bind_params("idds", $location_id, $latitude, $longitude, $address);
        $result = LocationManager::fetchLocations();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        if(isset($result)){
            return true;
        }
        return false;
    }
    
    public function getAllEventsForLocationAndRadius($location, $radius) {
        
        //this one is complicated due to polar coordinate types of latitude and logitude 
        // we could do some thinking on it latter for now I am using queries for 
        // this web source: https://www.scribd.com/presentation/2569355/Geo-Distance-Search-with-MySQL
        //TO BE TESTED YET, only partially tested in phpmyadmin
        
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT E.*,"
            . "7912 * ASIN( SQRT( "
            . "POWER(SIN((CENTER.latitude - POINT.latitude) * pi()/360), 2) "
            . "+ COS(CENTER.latitude * pi()/180) * COS(POINT.latitude * pi()/180) " 
            . "*POWER(SIN((CENTER.longitude - POINT.longitude) * pi()/360), 2) )) as distance " 
            . "FROM location POINT INNER JOIN event E ON POINT.id = E.location, location CENTER "
            . "WHERE CENTER.id = ? "
            . "AND POINT.longitude BETWEEN CENTER.longitude - ?/abs(cos(radians(CENTER.latitude))*69) "
                . " AND CENTER.longitude + ?/abs(cos(radians(CENTER.latitude))*69) " 
            . "AND POINT.latitude BETWEEN CENTER.latitude - (?/69) and CENTER.latitude + (?/69)" 
            . "HAVING distance < ? ORDER BY distance LIMIT 10;");
        $location_id = $location->getId();
        $sql_select->bind_params("idddd", $location_id, $radius, $radius, $radius, $radius);
        $result = EventManager::fetchEvents();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchLocations(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $latitude = null;
        $logitude = null;
        $address = null;
        $statement->bind_result($id, $latitude, $logitude, $address);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Comment($id, $latitude, $logitude, $address);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
