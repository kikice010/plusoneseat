<?php
// Swift Mailer Library
require_once 'constants.php';
require __SWIFT_MAILER__;
require_once __ENTITIES__.'User.php';
require_once __ENTITIES__.'UserEducation.php';
require_once __ENTITIES__.'UserWork.php';
require_once __ENTITIES__.'Interest.php';
require_once __ENTITIES__.'Language.php';
require_once __ENTITIES__.'Country.php';
require_once __DB_CONNECTION__.'UserManager.php';
require_once __DB_CONNECTION__.'UserEducationManager.php';
require_once __DB_CONNECTION__.'UserWorkManager.php';
require_once __DB_CONNECTION__.'UserInterestManager.php';
require_once __DB_CONNECTION__.'UserLanguageManager.php';
require_once __DB_CONNECTION__.'UserPhonenumberManager.php';

$method = filter_input(INPUT_SERVER, "REQUEST_METHOD");

switch ($method) {
  case 'GET':
    
    //Save mail address in the database
    $id = filter_input(INPUT_GET, "id");
    //$user = new User($id, null, null, null, null, null,null, null,null, null,null);
    $returned_user = UserManager::getUser($id);


    //echo json_encode($returned_user[0]);

    if(count($returned_user)>0)
    {
            $returned_education = UserEducationManager::getAllEducationForUser($returned_user);
            $returned_work = UserWorkManager::getAllWorkForUser($returned_user);
            $returned_interests = UserInterestManager::getAllInterestsForUser($returned_user);
            $returned_languages = UserLanguageManager::getAllLanguagesForUser($returned_user);
            $returned_phonenumbers = UserPhonenumberManager::getAllPhonenumberForUser($returned_user);
            // echo json_encode(strcmp($returned_password,$password));
            $result['success'] = 1;
            $result['message'] = 'User fetched.';
            $result['user'] = $returned_user;
            $result['user_education'] = $returned_education;
            $result['user_work'] = $returned_work;
            $result['user_interests'] = $returned_interests;
            $result['user_languages'] = $returned_languages;
            $result['user_phonenumbers'] = $returned_phonenumbers;
            echo json_encode($result);
  
    }
    else {
        $result['success'] = 0;
        $result['message'] = 'Login failed. Password or email not correct. Please check your input.';
        echo json_encode($result);
    }
}


?>