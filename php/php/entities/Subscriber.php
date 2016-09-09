<?php
/**
 * Description of user_picture
 * @author admin
 */
class Subscriber {
    var $id;
    var $email;
    
    function __construct($id, $email) {
        $this->id = $id;
        $this->email = $email;
    }

    public function getEmail(){
    	return $this->email;
    }

    public function getID(){
    	return $this->id;
    }
}
