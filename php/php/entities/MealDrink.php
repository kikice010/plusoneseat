<?php
/**
 * Description of course
 * @author admin
 */
class MealDrink {
    var $id;
    var $id_meal_offer;
    var $id_drink;
    
    function __construct($id, $id_meal_offer, $id_drink){
        $this->id = $id;
        $this->id_meal_offer = $id_meal_offer;
        $this->id_drink = $id_drink;
    }
    
    public function getId(){
        return $this->id;
    }
    
    public function getIdMealOffer(){
        return $this->id_meal_offer;
    }
    
    public function getDrink(){
        return $this->id_drink;
    }
    

}
