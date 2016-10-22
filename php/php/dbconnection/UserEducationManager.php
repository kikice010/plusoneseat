<?php
require_once 'constants.php';
require_once __ENTITIES__."UserEducation.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventPictureManager
 * @author admin
 */
class UserEducationManager {
    
    public function insertUserEducation($user,$university,$degree){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO user_education (id_user, degree, university) "
                . "VALUES(?, ?, ?);");
        $user_id = $user->getID();
        $sql_insert->bind_params("iss", $user_id, $degree, $university);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteUserEducation($user) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM user_education "
                . "WHERE id_user = ?;");
        $user_id = $user->getID();
        $sql_delete->bind_params("i", $user_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllEducationForUser($user){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * from user_education WHERE id_user = ?;");
        $id_user = $user->getID();
        $sql_select->bind_param("i", $id_user);
        $db_instance->executeStatement();
        $result = UserEducationManager::fetchEducations();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        //echo json_encode($result, JSON_PRETTY_PRINT);
        return $result;
    }

    public static function fetchEducations(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $id_user = null;
        $degree = null;
        $university = null;
        
        $statement->bind_result($id,$id_user, $degree, $university);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new UserEducation($university, $degree, $id_user);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
