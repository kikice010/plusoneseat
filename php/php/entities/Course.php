<?php
/**
 * Description of course
 * @author admin
 */
class Course {
    var $id;
    var $id_meal_offer;
    var $course_type;
    
    function __construct($id, $id_meal_offer, $course_type){
        $this->id = $id;
        $this->id_meal_offer = $id_meal_offer;
        $this->course_type = $course_type;
    }
    
    public function getId(){
        return $this->id;
    }
    
    public function getIdMealOffer(){
        return $this->id_meal_offer;
    }
    
    public function getCourseType(){
        return $this->course_type;
    }
    

}
