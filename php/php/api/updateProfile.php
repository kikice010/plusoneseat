<?php
// Swift Mailer Library
require_once 'constants.php';
require __SWIFT_MAILER__;
require_once __ENTITIES__.'User.php';
require_once __DB_CONNECTION__.'UserManager.php';
require_once __DB_CONNECTION__.'UserEducationManager.php';
require_once __DB_CONNECTION__.'UserWorkManager.php';
require_once __DB_CONNECTION__.'UserInterestManager.php';
require_once __DB_CONNECTION__.'UserLanguageManager.php';
require_once __DB_CONNECTION__.'UserPhonenumberManager.php';

$method = filter_input(INPUT_SERVER, "REQUEST_METHOD");

switch ($method) {
  case 'POST':
    
    //Save mail address in the database
    $json = filter_input(INPUT_POST, "json");
    $obj = json_decode($json,true);
    //echo json_encode($obj);
    $id = $obj['id'];
    //echo json_encode($id);
    $firstname = $obj['firstname'];
    $lastname = $obj['lastname'];
    $email = $obj['email'];
    $country = $obj['country'];
    $city = $obj['city'];
    $description = $obj['description'];
    $gender = $obj['gender'];
    $birthday = $obj['birthday'];
    $birth_location = $obj['birth_location'];
    $user = new User($id, $firstname, $lastname, $email, null, $country, $description, $gender, $birthday, $birth_location, $city);

    UserManager::updateUser($user);
    //echo json_encode($id);
    $languages = $obj['user_languages'];
    $user_education = $obj['user_education'];
    $user_work = $obj['user_work'];
    $user_interests = $obj['user_interests'];
    $user_phonenumbers = $obj['user_phonenumbers'];

    UserLanguageManager::deleteUserLanguages($user);
    UserEducationManager::deleteUserEducation($user);
    UserInterestManager::deleteAllUserInterests($user);
    UserWorkManager::deleteUserWork($user);
    UserPhonenumberManager::deleteAllUserPhonenumbers($user);
    //echo json_encode($languages);
    foreach ($languages as $value){
        //echo json_encode($value);
        $id_language = LanguageManager::fetchLanguageID($value["language"]);
        UserLanguageManager::insertUserLanguage($id_language,$id,$value["level"]);
    }
    foreach ($user_education as $value){
        UserEducationManager::insertUserEducation($user,$value["university"],$value["degree"]);
    }
    foreach ($user_interests as $value){  
        UserInterestManager::insertUserInterest($value["id"],$id);
    }
    foreach ($user_work as $value){  
        UserWorkManager::insertUserWork($user,$value["job"],$value["city"],$value["country"]);
    }
    foreach ($user_phonenumbers as $value){  
        UserPhonenumberManager::insertUserPhonenumber($value["country_code"],$id,$value["number"]);
    }
    
}


?>