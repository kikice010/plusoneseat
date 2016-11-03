<?php
require_once 'constants.php';
require_once __ENTITIES__."Language.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class LanguageManager {
    
 
    public static function fetchLanguages(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $language = null;
        $level = null;
        $tupple = null;
        $statement->bind_result($language, $level);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new UserLanguage($language, $level);
            array_push($result, $tupple);
        }
        
        return $result;
    }

    public static function fetchLanguageID($language){
        $db_instance = DBManager::getInstance();
        $db_instance->connect();
        $id = null;
        $name = null;
        $result = array();
       
        if($language!=null) {
            $query = "SELECT id FROM languages WHERE name LIKE ?;";
        } else {
            $query = "SELECT id FROM languages;";
        }

        $sql_select = $db_instance->prepare($query);

        if($language!=null) {
            $sql_select->bind_param("s", $language);
        } 
        $statement = $db_instance->getStatement();
        $statement->bind_result($id);
        $db_instance->executeStatement();
        while($db_instance->fetchResult()){
            $tupple = $id;
            array_push($result, $tupple);
        }
        $db_instance->closeStatement();
        $db_instance->closeConnection();

        return $result[0];
    }
}
