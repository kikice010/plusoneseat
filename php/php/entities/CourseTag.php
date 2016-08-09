<?php
/**
 * Description of CourseTag
 * @author admin
 */
class CourseTag {
    var $course;
    var $tag;
    
    function __construct($course, $tag) {
        $this->course = $course;
        $this->tag = $tag;
    }
    
    public function getCourse(){
        return $this->course;
    }
    
    public function  getTag(){
        return $this->tag;
    }
}
