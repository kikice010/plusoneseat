<?php
require_once 'constants.php';
require_once __ENTITIES__."UserPhonenumbers.php";
require_once __DB_CONNECTION__."DBManager.php";
require_once __DB_CONNECTION__.'CountryManager.php';

/**
 * Description of EventPictureManager
 * @author admin
 */
class UserPhonenumberManager {
    
    public function insertUserPhonenumber($country_code,$user_id,$number){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO user_phonenumbers (id_user, country_code, phonenumber) "
                . "VALUES(?, ?, ?);");
                $sql_insert->bind_params("iis", $user_id, $country_code, $number);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function deleteUserPhonenumber($country_code,$user_id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM user_phonenumbers "
                . "WHERE id_user = ? AND country_code = ?;");
        $sql_delete->bind_params("ii", $user_id, $country_code);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllPhonenumberForUser($user){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT UP.id_user, C.nicename, C.phonecode, UP.phonenumber "
                . "FROM country C INNER JOIN user_phonenumbers UP "
                . "ON UP.country_code = C.id   "
                . "WHERE UP.id_user = ?;");
        $user_id = $user->getId();
        $sql_select->bind_param("i", $user_id);
        $result = CountryManager::fetchCountry();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result;
    }
}
