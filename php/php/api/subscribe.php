<?php
// Swift Mailer Library
require_once 'constants.php';
require __SWIFT_MAILER__;
require_once __ENTITIES__.'Subscriber.php';
require_once __DB_CONNECTION__.'SubscriberManager.php';

$method = filter_input(INPUT_SERVER, "REQUEST_METHOD");

switch ($method) {
  case 'POST':
    
    //Save mail address in the database
    $sendTo = filter_input(INPUT_POST, "email");
    $subscriber = new Subscriber(-1, $sendTo);
    SubscriberManager::insertSubscriber($subscriber);

    // Mail Transport
    $transport = Swift_SmtpTransport::newInstance('ssl://smtp.gmail.com', 465 )
        ->setUsername('info@plusoneseat.com') // Your Gmail Username
        ->setPassword('rvrrcxluzrwmqhrj'); // Your Gmail Password

    // Mailer
    $mailer = Swift_Mailer::newInstance($transport);

    // Create a message
    $message = Swift_Message::newInstance('Thank you for subscribing to Plusoneseat.')
        ->setFrom(array('info@plusoneseat.com' => 'PlusOneSeat')) // can be $_POST['email'] etc...
        ->setTo(array($sendTo => $sendTo)) // your email / multiple supported.
        ->setBody('
            <!DOCTYPE html>
            <html>
                <body>

                    <table style="width:100%; background-color: #ef804a; color:white">
                        <tr style="height:150px">
                            <th style="width:25%"></th>
                            <th style="width:50%">
                              Thank you for subscribing!
                            </th>
                            <th style="width:25%"></th>
                        </tr>
                        <tr style="height:70%; background-color: #ef804a;">
                            <td></td>
                            <td style="height:150px; width: 200px">
                               "You are now subscribed to Plusoneseat.com, we will inform you of the news via our newsletter"
                            </td>
                            <td></td>
                        </tr>
                        <tr style="height:70%; background-color: #ef804a;">
                            <td></td>
                            <td style="height:150px; width: 200px">
                               
                            </td>
                            <td></td>
                        </tr>
                    </table>

                </body>
            </html>
        ', 'text/html');

    // Send the message
    if ($mailer->send($message)) {
        echo 'success';
    } else {
        echo 'error';
    }


    break;
  default:
    echo "Invalid request type for the API. Please use POST method."; 
    break;
}



?>