<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        require_once dirname(__FILE__).'/php/dbconnection/constants.php';       
        require_once __ENTITIES__."./Course.php";
        require_once __DB_CONNECTION__."./CourseTagManager.php";
        
        $course = new Course(2, "", "", 1);
                
        
        CourseTagManager::getAllTagsForCourse($course);
        
        echo "test";
        
        ?>
    </body>
</html>
