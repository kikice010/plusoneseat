<?php
/**
 * Description of picture
 * @author admin
 */
class Continent {
    var $code;
    var $name;
    
    function __construct($code, $name){
        $this->code = $code;
        $this->name = $name;
    }

     public function getId(){
        return $this->code;
    }
}
?>