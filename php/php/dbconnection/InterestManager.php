<?php
require_once 'constants.php';
require_once __ENTITIES__."Interest.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class InterestManager {
    
    public static function insertInterest($interest){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO interests (interest) "
                . "VALUES(?);");
        $sql_insert->bind_param("s", $interest);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteInterest($interest) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM interest "
                . "WHERE id = ?;");
        $id = $interest->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function fetchInterests(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $interest = null;
        $tupple = null;
        $statement->bind_result($id, $interest);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Interest($id, $interest);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
