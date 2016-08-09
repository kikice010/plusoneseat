<?php
/**
 * Description of MenuTag
 * @author admin
 */
class MenuTag {
    var $menu;
    var $tag;
    
    function __construct($menu, $tag) {
        $this->menu = $menu;
        $this->tag = $tag;
    }
}
