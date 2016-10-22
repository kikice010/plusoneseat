<?php
/**
 * Description of user_picture
 * @author admin
 */
class UserWork{
    var $id_user;
    var $job;
    var $city;
    var $country;
    
    function __construct($id_user, $job, $city,$country) {
        $this->id_user = $id_user;
        $this->job = $job;
        $this->city = $city;
        $this->country = $country;
    }
}
?>
