<?php
/**
 * Description of Tag
 * @author admin
 */
class Tag {
    var $id;
    var $name;
    var $description;
    
    function __construct($id, $name, $description) {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
    }
}
