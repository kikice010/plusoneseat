<?php
/**
 * Description of picture
 * @author admin
 */
class Interest {
    var $id;
    var $interest;
    
    function __construct($id, $interest){
        $this->id = $id;
        $this->interest = $interest;
    }
}
