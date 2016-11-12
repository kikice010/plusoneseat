<?php
require_once 'constants.php';
require_once __ENTITIES__."Continent.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class ContinentManager {
    
    public static function getContinentByName($name) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM continents WHERE name LIKE ?;");
        $sql_select->bind_param("s", $name);
        $result = ContinentManager::fetchContinent();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result[0];
    }
    
    public static function fetchContinent(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $code = null;
        $name = null;
        $tupple = null;
        $statement->bind_result($code, $name);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Continent($code, $name);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
