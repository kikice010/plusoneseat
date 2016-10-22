<?php
// Swift Mailer Library
require_once 'constants.php';
require __SWIFT_MAILER__;
require_once __ENTITIES__.'User.php';
require_once __ENTITIES__.'UserEducation.php';
require_once __ENTITIES__.'UserWork.php';
require_once __DB_CONNECTION__.'UserManager.php';
require_once __DB_CONNECTION__.'UserEducationManager.php';
require_once __DB_CONNECTION__.'UserWorkManager.php';

$method = filter_input(INPUT_SERVER, "REQUEST_METHOD");

switch ($method) {
  case 'GET':
    
    //Save mail address in the database
    $email = filter_input(INPUT_GET, "email");
    $user = new User(-1, null, null, $email, null, null,null, null,null, null,null);
    $returned_user = UserManager::getUserByEmail($user);


    //echo json_encode($returned_user[0]);

    if(count($returned_user)>0)
    {
            $returned_education = UserEducationManager::getAllEducationForUser($returned_user[0]);
            $returned_work = UserWorkManager::getAllWorkForUser($returned_user[0]);
            // echo json_encode(strcmp($returned_password,$password));
            $result['success'] = 1;
            $result['message'] = 'User fetched.';
            $result['user'] = $returned_user[0];
            $result['user_education'] = $returned_education;
            $result['user_work'] = $returned_work;
            echo json_encode($result);
  
    }
    else {
        $result['success'] = 0;
        $result['message'] = 'Login failed. Password or email not correct. Please check your input.';
        echo json_encode($result);
    }
}


?>