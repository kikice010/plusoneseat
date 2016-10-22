<?php
/**
 * Description of user_picture
 * @author admin
 */
class UserPicture {
    var $user;
    var $picture;
    
    function __construct($picture, $user) {
        $this->picture = $picture;
        $this->user = $user;
    }
}
?>
