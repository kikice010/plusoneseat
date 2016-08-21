<?php
require_once 'constants.php';
require_once __ENTITIES__."UserPicture.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventPictureManager
 * @author admin
 */
class UserPictureManager {
    
    public function userEventPicture($user_picture){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO user_has_picture (user_id, picture_id) "
                . "VALUES(?, ?);");
        $user_id = $user_picture->getEvent();
        $picture_id = $user_picture->getPicture();
        $sql_insert->bind_params("ii", $user_id, $picture_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteUserPicture($user_picture) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM user_has_picture "
                . "WHERE user_id = ? AND picture_id = ?;");
        $user_id = $user_picture->getEvent();
        $picture_id = $user_picture->getPicture();
        $sql_delete->bind_params("ii", $user_id, $picture_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllPicturesForUser($user){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT P.id, P.file_location "
                . "FROM picture P INNER JOIN user_has_picture UP "
                . "ON UP.picture_id = P.id   "
                . "WHERE UP.user_id = ?;");
        $user_id = $user->getId();
        $sql_select->bind_param("i", $user_id);
        $result = PictureManager::fetchPictures();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
}
