<?php
// Swift Mailer Library
require_once 'D:/wamp64/bin/vendor/swiftmailer/swiftmailer/lib/swift_required.php';

// Mail Transport
$transport = Swift_SmtpTransport::newInstance('tls://smtp.gmail.com', 587 )
    ->setUsername('info@plusoneseat.com') // Your Gmail Username
    ->setPassword('%100Forthem'); // Your Gmail Password

// Mailer
$mailer = Swift_Mailer::newInstance($transport);

// Create a message
$message = Swift_Message::newInstance('Wonderful Subject Here')
    ->setFrom(array('info@plusoneseat.com' => 'PlusOneSeat')) // can be $_POST['email'] etc...
    ->setTo(array('milos.colic@elfak.rs' => 'Milos COLIC')) // your email / multiple supported.
    ->setBody('Here is the <strong>message</strong> itself. It can be text or <h1>HTML</h1>.', 'text/html');

// Send the message
if ($mailer->send($message)) {
    echo 'Mail sent successfully.';
} else {
    echo 'I am sure, your configuration are not correct. :(';
}
?>