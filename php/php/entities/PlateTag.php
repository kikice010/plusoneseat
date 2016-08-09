<?php
/**
 * Description of PlateTag
 * @author admin
 */
class PlateTag {
    var $plate;
    var $tag;
    
    function __construct($plate, $tag) {
        $this->plate = $plate;
        $this->tag = $tag;
    }
}
