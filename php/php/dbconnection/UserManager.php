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
        $location = $user->getLocationID();

        // echo $email;
        // echo "\n";
        // echo $password;

        $sql_insert->bind_param("ssssi", $name, $surname, $email, $password, $location);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
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

    public static function getUser($email) {
        $db_instance = DBManager::getInstance();
        $db_instance->connect();

        if($email!=null) {
            $query = "SELECT id, name, surname, email, password, location FROM user WHERE email = ?;";
        } else {
            $query = "SELECT id, name, surname, email, password, location FROM user;";
        }

        $sql_select = $db_instance->prepare($query);

        if($email!=null) {
            $sql_select->bind_param("s", $email);
        } 

        $db_instance->executeStatement();
        $result = UserManager::fetchUsers();
        $db_instance->closeStatement();
        $db_instance->closeConnection();

        return $result;
    }

    public static function getUserByEmail($user) {
        $email = $user->getEmail();
        return UserManager::getUser($email);
    }

    public static function getAllUsers() {
        return UserManager::getUser(null);
    }

    
    public static function fetchUsers(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $name = null;
        $surname = null;
        $email = null;
        $password = null;
        $location = null;
        $statement->bind_result($id, $name, $surname, $email, $password, $location);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new User($id, $name, $surname, $email, $password, $location);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
