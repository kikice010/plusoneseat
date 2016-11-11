<?php
/**
 * Description of course
 * @author admin
 */
class MealPhoto {
    var $id;
    var $id_meal_offer;
    var $photo;
    
    function __construct($id, $id_meal_offer, $photo){
        $this->id = $id;
        $this->id_meal_offer = $id_meal_offer;
        $this->photo = $photo;
    }
    
    public function getId(){
        return $this->id;
    }
    
    public function getIdMealOffer(){
        return $this->id_meal_offer;
    }
    
    public function getPhoto(){
        return $this->photo;
    }
    

}
