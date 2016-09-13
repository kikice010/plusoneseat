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
    $user = new User(-1, null, null, $email, $password, null);
    $returned_user = UserManager::getUserByEmail($user);

    // echo json_encode($returned_user);

    if(count($returned_user)>0)
    {
        $returned_password = $returned_user[0]->getPassword();

        //echo json_encode($returned_password);
        // echo json_encode($password);
        if(strcmp($returned_password,$password)==0)
        {
            // echo json_encode(strcmp($returned_password,$password));
            $result['success'] = 1;
            $result['message'] = 'Login successful.';
            echo json_encode($result);
        } else {
            // echo json_encode(strcmp($returned_password,$password));
            $result['success'] = 0;
            $result['message'] = 'Login failed. Password or email not correct. Please check your input.';
            echo json_encode($result);
        }        
    }
    else {
        $result['success'] = 0;
        $result['message'] = 'Login failed. Password or email not correct. Please check your input.';
        echo json_encode($result);
    }
}
// $result['success'] = 0;
// $result['message'] = 'API Method ERROR. Please use POST.';
// echo json_encode($result);

?>