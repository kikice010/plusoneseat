<?php
/**
 * Description of picture
 * @author admin
 */
class Picture {
    var $id;
    var $file_location;
    
    function __construct($id, $file_location){
        $this->id = $id;
        $this->file_location = $file_location;
    }
}
