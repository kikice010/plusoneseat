<?php
/**
 * Description of Plate
 * @author admin
 */
class Plate {
    var $id;
    var $name;
    var $description;
    var $course;
    
    function __construct($id, $name, $description, $course) {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->course = $course;
    }
}
