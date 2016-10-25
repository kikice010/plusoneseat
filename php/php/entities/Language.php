<?php
/**
 * Description of picture
 * @author admin
 */
class Language {
    var $id;
    var $name;
    
    function __construct($id, $name){
        $this->id = $id;
        $this->name = $name;
    }
}
