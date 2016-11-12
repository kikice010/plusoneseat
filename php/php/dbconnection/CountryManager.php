<?php
require_once 'constants.php';
//require_once __ENTITIES__."Country.php";
require_once __ENTITIES__."Country.php";
require_once __ENTITIES__."UserPhonenumbers.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class CountryManager {
    public static function getCountryByName($name) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();

        $result = array();
        $id = null;
        $nicename = null;
        $phonecode = null;
        $tupple = null;

        $sql_select = $db_instance->prepare("SELECT id,nicename,phonecode "
                . "FROM country WHERE nicename LIKE ?;");
        $sql_select->bind_param("s", $name);
       
        $statement = $db_instance->getStatement();
        $statement->bind_result($id,$nicename,$phonecode);

        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){

            $tupple = new Country($id,$nicename, $phonecode);
            array_push($result, $tupple);
        }
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result[0];
    }
    
 
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
