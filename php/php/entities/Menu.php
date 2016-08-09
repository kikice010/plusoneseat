<?php
/**
 * Description of menu
 * @author admin
 */
class Menu {
    var $id;
    var $name;
    var $description;
    var $course_number;
    
    function __construct($id, $name, $description, $course_number) {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->course_number = $course_number;
    }
}
