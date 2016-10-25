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
}
