<?php
/**
 * Description of course
 * @author admin
 */
class Drink {
    var $id;
    var $name;
    var $alcoholic;
    
    function __construct($id, $name,$alcoholic){
        $this->id = $id;
        $this->name = $name;
        $this->alcoholic = $alcoholic;

    }
    
    public function getId(){
        return $this->id;
    }
    
    public function getName(){
        return $this->name;
    }

    public function getAlcoholic(){
        return $this->alcoholic;
    }
    

}
