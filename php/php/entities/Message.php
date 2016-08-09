<?php
/**
 * Entity class for the message object.
 * @author mcolic
 */
class Message {
    var $sender;
    var $receiver;
    var $time;
    var $id;
    var $content;
    
    function __construct($sender, $receiver, $time, $id, $content){
        $this->sender = $sender;
        $this->receiver = $receiver;
        $this->time = $time;
        $this->id = $id;
        $this->content = $content;
    }
}
