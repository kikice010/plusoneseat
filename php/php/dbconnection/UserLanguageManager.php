<?php
require_once 'constants.php';
require_once __ENTITIES__."UserLanguage.php";
require_once __DB_CONNECTION__."DBManager.php";
require_once __DB_CONNECTION__.'LanguageManager.php';

/**
 * Description of EventPictureManager
 * @author admin
 */
class UserLanguageManager {
    
    public function insertUserLanguage($id_language,$user_id,$level){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO user_languages (id_user, id_language, level) "
                . "VALUES(?, ?);");
                $sql_insert->bind_params("iis", $user_id, $id_language, $level);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteUserLanguages($user) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM user_languages "
                . "WHERE id_user = ?;");
        $user_id = $user->getId();
        $sql_delete->bind_params("i", $user_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllLanguagesForUser($user){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT L.name, UL.level "
                . "FROM languages L INNER JOIN user_languages UL "
                . "ON UL.id_language = L.id   "
                . "WHERE UL.id_user = ?;");
        $user_id = $user->getId();
        $sql_select->bind_param("i", $user_id);
        $result = LanguageManager::fetchLanguages();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result;
    }
}
