<?php
/**
 * Entity class for guest
 * @author mcolic
 */
class Guest {
    var $event;
    var $guest;
    var $status;
    
    function __construct($event, $guest, $status) {
        $this->event = $event;
        $this->guest = $guest;
        $this->status = $status;
    }
}
