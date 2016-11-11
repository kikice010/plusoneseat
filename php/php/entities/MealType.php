<?php
/**
 * Description of event
 * @author admin
 */
class MealType {
    var $id;
    var $type_name;
    
    function __construct($id, $type_name){
        $this->id = $id;
        $this->type_name = $type_name;
        
    }
    
    
}
?>