<?php
/**
 * Description of user_picture
 * @author admin
 */
class UserLanguage {
    var $language;
    var $level;
    
    function __construct($language, $level) {
        $this->language = $language;
        $this->level = $level;
    }
}
?>
