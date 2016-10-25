<?php
/**
 * Entity class for user
 * @author mcolic
 */
class User {
    var $id;
    var $firstname;
    var $lastname;
    var $email;
    var $password;
    var $country;
    var $city;
    var $description;
    var $gender;
    var $birthday;
    var $birth_location;
    
    function __construct($id, $firstname, $lastname, $email, $password, $country, $description, $gender, $birthday, $birth_location, $city){
        $this->id = $id;
        $this->firstname = $firstname;
        $this->lastname = $lastname;
        $this->email = $email;
        $this->password = $password;
        $this->country = $country;
        $this->city = $city;
        $this->description = $description;
        $this->gender = $gender;
        $this->birthday = $birthday;
        $this->birth_location = $birth_location;
        //user education is array of Education objects
        // $this->education = $education;
        // $this->work = $work;
        // $this->interests = $interests;
        // $this->laguages = $languages;
        // $this->phone_numbers = $phone_numbers;
    }

    public function getID(){
        return $this->id;
    }

    public function getName(){
        return $this->firstname;
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

    public function getCountry(){
        return $this->country;
    }
    public function getCity(){
        return $this->city;
    }
    public function getDescription(){
        return $this->description;
    }
    public function getBirthday(){
        return $this->birthday;
    }
    public function getGender(){
        return $this->gender;
    }
    public function getBirthlocation(){
        return $this->birth_location;
    }
    public function getEducation(){
        return $this->education;
    }
    public function getWork(){
        return $this->work;
    }
    public function getInterests(){
        return $this->interests;
    }
    public function getLanguages(){
        return $this->languages;
    }
    public function getPhonenumbers(){
        return $this->phone_numbers;
    }
}
?>