<?php
require_once 'constants.php';
require_once __ENTITIES__."UserInterest.php";
require_once __DB_CONNECTION__."DBManager.php";
require_once __DB_CONNECTION__.'InterestManager.php';

/**
 * Description of EventPictureManager
 * @author admin
 */
class UserInterestManager {
    
    public function insertUserInterest($id_interest,$user_id){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO user_interests (id_user, id_interests) "
                . "VALUES(?, ?);");
                $sql_insert->bind_params("ii", $user_id, $id_interest);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteUserInterests($id_interest,$user_id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM user_interests "
                . "WHERE id_user = ? AND id_interests = ?;");
        $sql_delete->bind_params("ii", $user_id, $picture_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllInterestsForUser($user){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT I.id, I.interest "
                . "FROM interests I INNER JOIN user_interests UI "
                . "ON UI.id_interests = I.id   "
                . "WHERE UI.id_user = ?;");
        $user_id = $user->getId();
        $sql_select->bind_param("i", $user_id);
        $result = InterestManager::fetchInterests();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result;
    }
}
