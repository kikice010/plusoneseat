<?php
require_once 'constants.php';
require_once __ENTITIES__."User.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventManager
 * @author mcolic
 */
class UserManager {
    public static function insertUser($user){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO user (name, surname, email, password,location) "
                . "VALUES(?, ?, ?, ?, ?);");
        $name = $user->getName();
        $surname = $user->getSurname();
        $email = $user->getEmail();
        $password = $user->getPassword();
        $location = $user->getLocation();
        $sql_insert->bind_params("siisid", $name, $surname, $email, $password, $location);
        $db_instance->executeStatement();
        $db_instance->disconnect();
    }
    
    public static function deleteUser($user) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM user "
                . "WHERE id = ?;");
        $id = $user->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function fetchUsers(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $surname = null;
        $email = null;
        $pasword = null;
        $location = null;
        $statement->bind_result($id, $name, $location, $surname, $pasword, $email, $location);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Comment($id, $description, $name, $location, $surname, $pasword, $email, $location);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
