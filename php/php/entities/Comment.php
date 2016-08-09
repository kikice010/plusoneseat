<?php
/**
 * Entity class for comment
 * @author mcolic
 */
class Comment {
    var $id;
    var $content;
    var $time;
    var $event;
    var $user;
    
    function __construct($id, $content, $time, $event, $user) {
        $this->id = $id;
        $this->content = $content;
        $this->time = $time;
        $this->event = $event;
        $this->user = $user;
    }
    
    public function getId(){
        return $this->id;
    }
    
    public function getContent(){
        return $this->content;
    }
    
    public function getTime(){
        return $this->time;
    }
    
    public function getEvent(){
        return $this->event;
    }
    
    public function getUser(){
        return $this->user;
    }
    
   
}
