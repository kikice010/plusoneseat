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

    UserLanguageManager::deleteUserLanguages($user);
    //echo json_encode($languages);
    foreach ($languages as $value){
        //echo json_encode($value);
        $id_language = LanguageManager::fetchLanguageID($value["language"]);
        echo json_encode($id_language);
        echo json_encode($id);
        echo json_encode($value['level']);
        UserLanguageManager::insertUserLanguage($id_language,$id,$value["level"]);
    }
}


?>