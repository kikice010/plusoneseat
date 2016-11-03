<?php
/**
 * Description of user_picture
 * @author admin
 */
class UserPhonenumbers {
    var $id_user;
    var $nicename;
    var $country_code;
    var $number;
    
    function __construct($id_user,$nicename, $country_code, $number) {
        $this->id_user = $id_user;
        $this->nicename = $nicename;
        $this->country_code = $country_code;
        $this->number = $number;
    }
}
?>
