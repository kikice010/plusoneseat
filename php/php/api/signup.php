<?php
// Swift Mailer Library
require_once 'constants.php';
require __SWIFT_MAILER__;
require_once __ENTITIES__.'User.php';
require_once __DB_CONNECTION__.'UserManager.php';

$method = filter_input(INPUT_SERVER, "REQUEST_METHOD");

switch ($method) {
  case 'POST':

    //Save mail address in the database
    $email = filter_input(INPUT_POST, "email");
    $password = filter_input(INPUT_POST, "password");

    $user = new User(-1, null, null, $email, $password, null, null, null, null, null, null);
    $returned_user = UserManager::getUserByEmail($user);

    if(count($returned_user)==0)
    {
        UserManager::insertUser($user);
        
        $result['success'] = 1;
        $result['message'] = 'User registration successful.';
        echo json_encode($result);
    }
    else {
        $result['success'] = 0;
        $result['message'] = 'Registration failed. Email already in use.';
        echo json_encode($result);
       
    }
}

?>