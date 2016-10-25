<?php
/**
 * Description of user_picture
 * @author admin
 */
class UserInterest{
    var $id_user;
    var $id_interest;
    
    
    function __construct($id_user, $id_interest) {
        $this->id_user = $id_user;
        $this->id_interest = $id_interest;

    }
}
?>
