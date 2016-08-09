<?php
/**
 * Description of course
 * @author admin
 */
class Course {
    var $id;
    var $name;
    var $description;
    var $menu;
    
    function __construct($id, $name, $description, $menu){
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->menu = $menu;
    }
    
    public function getId(){
        return $this->id;
    }
    
    public function getName(){
        return $this->name;
    }
    
    public function getDescription(){
        return $this->description;
    }
    
    public function getMenu(){
        return $this->menu;
    }
}
