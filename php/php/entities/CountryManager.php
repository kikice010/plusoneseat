<?php
require_once 'constants.php';
require_once __ENTITIES__."Country.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class CountryManager {
    
 
    public static function fetchCountry(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $phonecode = null;
        $tupple = null;
        $statement->bind_result($id, $name, $phonecode);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Country($id, $name, $phonecode);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
