<?php
/**
 * Entity class for location
 * @author mcolic
 */
class Location {
    var $id;
    var $latitude;
    var $longitude;
    var $address;
    
    function __construct($id, $latitude, $longitude, $address) {
        $this->id = $id;
        $this->latitude = $latitude;
        $this->longitude = $longitude;
        $this->address = $address;
    }
}
