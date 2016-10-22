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
        $sql_insert = $db_instance->prepare("INSERT INTO user (firstname, lastname, email, password,country,description,gender,birthday,birth_location,city) "
                . "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);");
        $firstname = $user->getName();
        $lastname = $user->getSurname();
        $email = $user->getEmail();
        $password = $user->getPassword();
        $country = $user->getCountry();
        $city = $user->getCity();
        $description = $user->getDescription();
        $gender = $user->getGender();
        $birthday = $user->getBirthday();
        $birth_location = $user->getBirthlocation();
        $sql_insert->bind_param("ssssssdss", $firstname, $lastname, $email, $password, $country,$description,$gender,$birthday,$birth_location,$city);
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

    public static function getUser($id) {
        $db_instance = DBManager::getInstance();
        $db_instance->connect();

        if($id!=null) {
            $query = "SELECT * FROM user WHERE id = ?;";
        } else {
            $query = "SELECT * FROM user;";
        }

        $sql_select = $db_instance->prepare($query);

        if($id!=null) {
            $sql_select->bind_param("s", $id);
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
        $firstname = null;
        $lastname = null;
        $email = null;
        $password = null;
        $country = null;
        $city = null;
        $description = null;
        $gender = null;
        $birthday = null;
        $birth_location = null;
        $statement->bind_result($id, $firstname, $lastname, $email, $password, $country,$description,$gender,$birthday,$birth_location,$city);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new User($id,$firstname, $lastname, $email, $password, $country,$description,$gender,$birthday,$birth_location,$city);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
?>