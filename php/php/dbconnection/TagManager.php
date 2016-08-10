<?php
require_once 'constants.php';
require_once __ENTITIES__."Tag.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class TagManager {
    
    public static function fetchTags(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $description = null;
        $tupple = null;
        $statement->bind_result($id, $name, $description);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Tag($id, $name, $description);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
