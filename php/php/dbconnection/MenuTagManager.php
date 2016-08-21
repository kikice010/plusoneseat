<?php
require_once 'constants.php';
require_once __ENTITIES__."MenuTag.php";
require_once __DB_CONNECTION__."TagManager.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseTagManager
 * @author admin
 */
class CourseTagManager {
    
    public static function insertMenuTag($menu_tag){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO menu_has_tag (menu_id, tag_id) "
                . "VALUES(?, ?);");
        $menu = $menu_tag->getMenu();
        $tag = $menu_tag->getTag();
        $sql_insert->bind_param("ii", $menu, $tag);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteMenuTag($menu_tag) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM menu_has_tag "
                . "WHERE menu_id = ? AND tag_id = ?;");
        $menu = $menu_tag->getMenu();
        $tag = $menu_tag->getTag();
        $sql_delete->bind_param("ii", $menu, $tag);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function getAllTagsForMenu($menu){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT T.id, T.name, T.description "
                . "FROM menu_has_tag MT INNER JOIN tag T "
                . "ON MT.tag_id = T.id   "
                . "WHERE MT.menu_id = ?;");
        $menu_id = $menu->getId();
        $sql_select->bind_param("i", $menu_id);
        $result = TagManager::fetchTags();        
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        echo json_encode($result, JSON_PRETTY_PRINT);
        return json_encode($result, JSON_PRETTY_PRINT);
    }
}
