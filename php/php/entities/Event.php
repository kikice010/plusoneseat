<?php
/**
 * Description of event
 * @author admin
 */
class Event {
    var $id;
    var $description;
    var $location;
    var $host;
    var $time;
    var $menu;
    var $price;
    
    function __construct($id, $descrition, $location, $host, $time, $menu, $price){
        $this->id = $id;
        $this->description = $descrition;
        $this->location = $location;
        $this->host = $host;
        $this->time = $time;
        $this->menu = $menu;
        $this->price = $price;
    }
    
    
}
?>