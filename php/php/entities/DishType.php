<?php
/**
 * Description of course
 * @author admin
 */
class DishType {
    var $id;
    var $name;
    
    function __construct($id, $name){
        $this->id = $id;
        $this->name = $name;

    }
    
    public function getId(){
        return $this->id;
    }
    
    public function getName(){
        return $this->name;
    }
    

}
