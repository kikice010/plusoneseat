<?php
/**
 * Description of event
 * @author admin
 */
class MealOffer {
    var $id;
    var $meal_type;
    var $meal_name;
    var $continent;
    var $country;
    var $description;
    var $min_seat;
    var $max_seat;
    var $price;
    var $date;
    var $start_time;
    var $course_option;
    var $end_time;
    var $donation_type;
    var $number_of_donations;
    // var $host;
    
    function __construct($id,$meal_type,$meal_name,$continent,$country,$description,$min_seat,$max_seat,$price,$date,$start_time,$course_option,$end_time,$donation_type,$number_of_donations){
        $this->id = $id;
        $this->meal_type = $meal_type;
        $this->meal_name = $meal_name;
        $this->continent = $continent;
        $this->country = $country;
        $this->description = $description;
        $this->min_seat = $min_seat;
        $this->max_seat = $max_seat;
        $this->price = $price;
        $this->date = $date;
        $this->start_time = $start_time;
        $this->course_option = $course_option;
        $this->end_time = $end_time;
        $this->donation_type = $donation_type;
        $this->number_of_donations = $number_of_donations;

    }

    public function getId(){
        return $this->id;
    }
    
    public function getIdMealType(){
        return $this->meal_type;
    }
    
    public function getMealName(){
        return $this->meal_name;
    }

    public function getContinent(){
        return $this->continent;
    }
    
    public function getCountry(){
        return $this->country;
    }
    
    public function getDescription(){
        return $this->description;
    }

    public function getMinSeat(){
        return $this->min_seat;
    }
    
    public function getMaxSeat(){
        return $this->max_seat;
    }
    
    public function getPrice(){
        return $this->price;
    }

    public function getDate(){
        return $this->date;
    }
    
    public function getStartTime(){
        return $this->start_time;
    }
    
    public function getCourseOption(){
        return $this->course_option;
    }
    public function getEndTime(){
        return $this->end_time;
    }
    
    public function getDonationType(){
        return $this->donation_type;
    }
    
    public function getNumberOfDonations(){
        return $this->number_of_donations;
    }
    
}
?>