<?php
require_once 'constants.php';
require_once __ENTITIES__."UserWork.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventPictureManager
 * @author admin
 */
class UserWorkManager {
    public function insertUserWork($user,$job,$city,$country){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO user_work (id_user, job, city, country) VALUES(?, ?, ?, ?);");
        $id_user = $user->getID();
        $sql_insert->bind_params("isss", $id_user, $job, $city, $country);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteUserWork($user) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM user_work "
                . "WHERE id_user = ?;");
        $user_id = $user->getID();
        $sql_delete->bind_params("i", $user_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllWorkForUser($user){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * from user_work WHERE id_user = ?;");
        $id_user = $user->getID();
        $sql_select->bind_param("i", $id_user);
        $db_instance->executeStatement();
        $result = UserWorkManager::fetchWork();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        //echo json_encode($result, JSON_PRETTY_PRINT);
        return $result;
    }

    public static function fetchWork(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $id_user = null;
        $job = null;
        $city = null;
        $country = null;
        
        $statement->bind_result($id,$id_user, $job, $city, $country);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new UserWork($id_user, $job, $city, $country);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
?>