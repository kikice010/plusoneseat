<?php
/**
 * Description of pictures_event
 * @author admin
 */
class EventPicture {
    var $picture;
    var $event;
    
    function __construct($picture, $event) {
        $this->picture = $picture;
        $this->event = $event;
    }
}
