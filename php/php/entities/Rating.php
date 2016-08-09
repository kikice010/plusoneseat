<?php
/**
 * Entity class for rating
 * @author mcolic
 */
class Rating {
    var $rating;
    var $comment;
    var $time;
    var $reviwer;
    var $rating_type;
    var $reviewee;
    
    function __construct($rating, $comment, $time, $reviwer, $rating_type, $reviewee){
        $this->rating = $rating;
        $this->comment = $comment;
        $this->time = $time;
        $this->reviwer = $reviwer;
        $this->rating_type = $rating_type;
        $this->reviewee = $reviewee;
    }
}
