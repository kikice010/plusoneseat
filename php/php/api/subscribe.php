<?php

$errorMSG = "";

// EMAIL
if (empty($_POST["email"])) {
    $errorMSG .= "Email is required ";
} else {
    $email = $_POST["email"];
}



$EmailTo = "milos.colic@elfak.rs";
$Subject = "Plusoneseat Newsletter";

// prepare email body text
$Body = "Content will be added latter";
$headers = 'From:'.$email. "\r\n" .
    'Reply-To:'.$email."\r\n" .
    'X-Mailer: PHP/' . phpversion();

// send email
$success = mail($EmailTo, $Subject, $Body, $headers);

// redirect to success page
if ($success && $errorMSG == ""){
   echo "success";
}else{
    if($errorMSG == ""){
        echo "Something went wrong :(";
    } else {
        echo $errorMSG;
    }
}

?>