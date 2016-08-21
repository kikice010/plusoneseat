<?php
require_once 'constants.php';
require_once __ENTITIES__."Message.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CommentManager
 * @author admin
 */
class MessageManager {
    
    public static function insertMessage($message){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO message (content, time, sender, receiver) "
                . "VALUES(?, ?, ?, ?);");
        $content = $message->getContent();
        $time = $message->getTime();
        $sender_id = $message->getSender();
        $receiver_id = $message->getReceiver();
        $sql_insert->bind_params("ssii", $content, $time, $sender_id, $receiver_id);
        $db_instance->executeStatement();
        $db_instance->disconnect();
    }
    
    public static function deleteMessage($message) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM message "
                . "WHERE id = ?;");
        $id = $message->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function getAllMessagesForSender($sender) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, content, time, sender, receiver "
                . "FROM message WHERE sender = ?;");
        $sender_id = $sender->getId();
        $sql_select->bind_params("i", $sender_id);
        $result = MessageManager::fetchMessages();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public function getAllMessagesForReceiver($receiver) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, content, time, sender, receiver "
                . "FROM message WHERE receiver = ?;");
        $receiver_id = $receiver->getId();
        $sql_select->bind_params("i", $receiver_id);
        $result = MessageManager::fetchMessages();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public function getAllMessagesForConversation($sender, $receiver) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, content, time, sender, receiver "
                . "FROM message WHERE sender = ? AND receiver = ?;");
        $sender_id = $sender->getId();
        $receiver_id = $receiver->getId();
        $sql_select->bind_params("ii", $sender_id, $receiver_id);
        $result = MessageManager::fetchMessages();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchMessages(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $content = null;
        $time = null;
        $sender = null;
        $receiver = null;
        $tupple = null;
        $statement->bind_result($id, $content, $time, $sender, $receiver);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Comment($id, $content, $time, $sender, $receiver);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
