<?php
require_once 'constants.php';
//require_once __ENTITIES__."Country.php";
require_once __ENTITIES__."UserPhonenumbers.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class CountryManager {
    
 
    public static function fetchCountry(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        //echo $statement;
        $id = null;
        $nicename = null;
        $country_code = null;
        $number = null;
        $tupple = null;



        $statement->bind_result($id,$nicename,$country_code,$number);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){

            $tupple = new UserPhonenumbers($id,$nicename, $country_code, $number);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
