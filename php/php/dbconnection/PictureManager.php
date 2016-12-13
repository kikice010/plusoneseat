<?php
require_once 'constants.php';
require_once __ENTITIES__."Picture.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of TagManager
 * @author mcolic
 */
class PictureManager {
    
    public static function insertPicture($picture){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO picture (file_location) "
                . "VALUES(?);");
        $file_location = $picture->getFileLocation();
        $sql_insert->bind_param("s", $file_location);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deletePicture($picture) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM picture "
                . "WHERE id = ?;");
        $id = $picture->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function fetchPictures(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $file_location = null;
        $tupple = null;
        $statement->bind_result($id, $file_location);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Picture($id, $file_location);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
