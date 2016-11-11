<?php
/**
 * Description of event
 * @author admin
 */
class Dish {
    var $id;
    var $id_course;
    var $id_dish_type;
    var $ingredients;
    var $main_dish;
    var $dish_name;
    
    
    function __construct($id,$id_course,$id_dish_type,$ingredients,$main_dish,$dish_name){
        $this->id = $id;
        $this->id_course = $id_course;
        $this->id_dish_type = $id_dish_type;
        $this->ingredients = $ingredients;
        $this->main_dish = $main_dish;
        $this->dish_name = $dish_name;
    }

    public function getId(){
        return $this->id;
    }

    public function getIdCourse(){
        return $this->id_course;
    }
    
    public function getMealIdDishType(){
        return $this->id_dish_type;
    }

    public function getIngredients(){
        return $this->ingredients;
    }
    
    public function getMainDish(){
        return $this->main_dish;
    }
    
    public function getDishName(){
        return $this->dish_name;
    }
    
}
?>