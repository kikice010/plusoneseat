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
    $id = filter_input(INPUT_GET, "id_user");
    $firstname = filter_input(INPUT_GET, "firstname");
    $lastname = filter_input(INPUT_GET, "lastname");
    $email = filter_input(INPUT_GET, "email");
    $country = filter_input(INPUT_GET, "country");
    $city = filter_input(INPUT_GET, "city");
    $description = filter_input(INPUT_GET, "description");
    $gender = filter_input(INPUT_GET, "gender");
    $birthday = filter_input(INPUT_GET, "birthday");
    $birth_location = filter_input(INPUT_GET, "birth_location");
    $user = new User($id, $firstname, $lastname, $email, null, $country, $city,$description, $gender,$birthday, $birth_location);
    
    UserManager::updateUser($new_user);

    $languages = filter_input(INPUT_GET, "lagunages");

    UserLanguageManager::deleteUserLanguages($user);

    foreach ($languages as $value){
        $id_language = LanguageManager::fetchLanguageID($value["name"]);
        UserLanguageManager::insertUserLanguage($id_language,$id,$value["level"]);
    }
}


?>