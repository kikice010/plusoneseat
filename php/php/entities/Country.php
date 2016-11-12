<?php
/**
 * Description of picture
 * @author admin
 */
class Country {
    var $id;
    var $name;
    var $phonecode;
    
    function __construct($id, $name, $phonecode){
        $this->id = $id;
        $this->name = $name;
        $this->phonecode = $phonecode;
    }

     public function getId(){
        return $this->id;
    }
}
?>