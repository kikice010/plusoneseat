<?php
/**
 * Entity class for user
 * @author mcolic
 */
class User {
    var $id;
    var $name;
    var $surname;
    var $email;
    var $password;
    var $location;
    
    function __construct($id, $name, $surname, $email, $password, $location){
        $this->id = $id;
        $this->name = $name;
        $this->surname = $surname;
        $this->email = $email;
        $this->password = $password;
        $this->location = $location;
    }

    public function getID(){
        return $this->id;
    }

    public function getName(){
        return $this->name;
    }

    public function getSurname(){
        return $this->surname;
    }

    public function getEmail(){
        return $this->email;
    }

    public function getPassword(){
        return $this->password;
    }

    public function getLocationID(){
        return $this->location;
    }
}
