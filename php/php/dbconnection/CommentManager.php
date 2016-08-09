<?php
 
require_once 'constants.php';
require_once __ENTITIES__."Comment.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CommentManager
 * @author admin
 */
class CommentManager {
    
    function __construct(){
    }

    function __destruct(){
    }
    
    public function insertComment($comment){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO comment (content, time, event, user) "
                . "VALUES(?, ?, ?, ?);");
        $sql_insert->bind_params("ssii", $comment->getContent(),
                $comment->getTime(), $comment->getEvent(), $comment->getUser());
        $sql_insert->execute();
        $db_instance->disconnect();
    }
    
    public function getAllCommentsForEvent($event) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * WHERE event = ?;");
        $sql_select->bind_params("i", $event->getId());
        $sql_select->execute();
        $db_instance->disconnect();
    }
}
