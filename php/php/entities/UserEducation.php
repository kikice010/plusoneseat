<?php
/**
 * Description of user_picture
 * @author admin
 */
class UserEducation {
    var $id_user;
    var $university;
    var $degree;
    
    function __construct($university, $degree, $id_user) {
        $this->university = $university;
        $this->degree = $degree;
        $this->id_user = $id_user;
    }
}
?>
