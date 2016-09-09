<?php
require_once 'constants.php';
require_once __ENTITIES__."Subscriber.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of EventPictureManager
 * @author admin
 */
class SubscriberManager {
    
    public static function insertSubscriber($subscriber){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO subscriber (email) "
                . "VALUES(?);");
        $subscriber_email = $subscriber->getEmail();
        $sql_insert->bind_param("s", $subscriber_email);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteSubscriber($subscriber) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM subscriber "
                . "WHERE email = ?;");
        $subscriber_email = $subscriber->getEmail();
        $sql_delete->bind_param("s", $subscriber_email);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllSubscribers(){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM subscriber;");
        $result = SubscriberManager::fetchSubscribers();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }

    public static function fetchSubscribers(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $email = null;
        $tupple = null;
        $statement->bind_result($id, $email);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Subscriber($id, $email);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
