<?php
require_once 'constants.php';
require_once __ENTITIES__."Comment.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CommentManager
 * @author admin
 */
class CommentManager {
    
    public static function insertComment($comment){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO comment (content, time, event, user) "
                . "VALUES(?, ?, ?, ?);");
        $content = $comment->getContent();
        $time = $comment->getTime();
        $event_id = $comment->getEvent();
        $user_id = $comment->getUser();
        $sql_insert->bind_params("ssii", $content, $time, $event_id, $user_id);
        $db_instance->executeStatement();
        $db_instance->disconnect();
    }
    
    public static function deleteComment($comment) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM comment "
                . "WHERE id = ?;");
        $id = $comment->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function getAllCommentsForEvent($event) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, content, time, event, user "
                . "FROM comment WHERE event = ?;");
        $event_id = $event->getId();
        $sql_select->bind_params("i", $event_id);
        $result = CommentManager::fetchComments();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchComments(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $content = null;
        $time = null;
        $event = null;
        $user = null;
        $tupple = null;
        $statement->bind_result($id, $content, $time, $event, $user);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Comment($id, $content, $time, $event, $user);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
