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
    $password = filter_input(INPUT_POST, "pasword");
    $user = new User(-1, null, null, $email, $password, null);
    $returned_user = UserManager::getUserByEmail($user);

    if(count($returned_user)==0)
    {
        UserManager::insertUser($user);

        echo "{
            success: 1,
            message: 'User registration successful.'
        }";
    }
    else {
        echo "{
            success: 0,
            message: 'Registration failed. Email already in use.'
        }";
    }
}

echo "{
        success: 0,
        message: 'API Method ERROR. Please use POST.'
    }";

?>