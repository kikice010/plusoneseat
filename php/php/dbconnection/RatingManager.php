<?php
require_once 'constants.php';
require_once __ENTITIES__."Rating.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CommentManager
 * @author admin
 */
class RatingManager {
    
    public static function insertRating($rating){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO "
                . "rating (rating, comment, time, reviewer, reviewee, rating_type) "
                . "VALUES(?, ?, ?, ?, ?, ?);");
        $rating_val = $rating->getRating();
        $comment = $rating->getComment();
        $time = $rating->getTime();
        $reviewer = $rating->getReviewer();
        $reviewee = $rating->getReviewee();
        $rating_type = $rating->getRatingType();
        $sql_insert->bind_params("issiii", $rating_val, $comment, $time,
                $reviewer, $reviewee, $rating_type);
        $db_instance->executeStatement();
        $db_instance->disconnect();
    }
    
    public static function deleteRating($rating) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM message "
                . "WHERE reviewer = ? AND reviewee = ?;");
        $reviewer_id = $rating->getReviewer();
        $reviewee_id = $rating->getReviewee();
        $sql_delete->bind_param("ii", $reviewer_id, $reviewee_id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public function getAllRatingsForReviewee($reviewee) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id, rating, comment, time, reviewer, reviewee, rating_type "
                . "FROM rating WHERE reviewee = ?;");
        $reviewee_id = $reviewee->getId();
        $sql_select->bind_params("i", $reviewee_id);
        $result = RatingManager::fetchRatings();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
    
    public static function fetchRatings(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $rating = null;
        $comment = null;
        $time = null;
        $reviewer = null;
        $reviewee = null;
        $rating_type = null;
        $tupple = null;
        $statement->bind_result($id, $rating, $comment, $time, $reviewee, $reviewer, $rating_type);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new Comment($id, $rating, $comment, $time, $reviewee, $reviewer, $rating_type);
            array_push($result, $tupple);
        }
        
        return $result;
    }
}
