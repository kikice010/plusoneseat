<?php
require_once 'constants.php';
require_once __ENTITIES__."MealOffer.php";
require_once __DB_CONNECTION__."DBManager.php";

/**
 * Description of CourseManager
 * @author admin
 */
class MealOfferManager {
    
    public static function insertMealOffer($meal_offer){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_insert = $db_instance->prepare("INSERT INTO meal_offer (host_id,meal_type, meal_name, continent_id,country_id,description,min_seats, max_seats, price_per_seat,meal_date,start_time, course_option, end_time,donation_type,number_of_donations, currency) "
                . "VALUES(?,?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?);");
        $host_id = $meal_offer->getHostId();
        $meal_type = $meal_offer->getIdMealType();
        $meal_name = $meal_offer->getMealName();
        $continent = $meal_offer->getContinent();
        $country = $meal_offer->getCountry();
        $description = $meal_offer->getDescription();
        $min_seat = $meal_offer->getMinSeat();
        $max_seat = $meal_offer->getMaxSeat();
        $price = $meal_offer->getPrice();
        $date = $meal_offer->getDate();
        $start_time = $meal_offer->getStartTime();
        $course_option = $meal_offer->getCourseOption();
        $end_time = $meal_offer->getEndTime();
        $donation_type = $meal_offer->getDonationType();
        $number_of_donations = $meal_offer->getNumberOfDonations();
        $currency = $meal_offer->getCurrency();
        $sql_insert->bind_param("isssisiidssissis", $host_id,$meal_type, $meal_name, $continent, $country, $description, $min_seat, $max_seat, $price, $date, $start_time, $course_option, $end_time, $donation_type, $number_of_donations,$currency);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    
    public static function deleteMealOffer($meal_offer) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_delete = $db_instance->prepare("DELETE FROM meal_offer "
                . "WHERE id = ?;");
        $id = $meal_offer->getId();
        $sql_delete->bind_param("i", $id);
        $db_instance->executeStatement();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
    }
    public static function getMealOfferId($meal_offer) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT id "
                . "FROM meal_offer WHERE host_id = ? AND meal_type LIKE ? AND meal_name LIKE ? AND continent_id LIKE ? AND country_id = ? AND description LIKE ? AND min_seats = ? AND max_seats= ? AND  price_per_seat = ? AND meal_date LIKE ? AND start_time LIKE ? AND course_option = ?;");
        $host_id = $meal_offer->getHostId();
        $meal_type = $meal_offer->getIdMealType();
        $meal_name = $meal_offer->getMealName();
        $continent = $meal_offer->getContinent();
        $country = $meal_offer->getCountry();
        $description = $meal_offer->getDescription();
        $min_seat = $meal_offer->getMinSeat();
        $max_seat = $meal_offer->getMaxSeat();
        $price = $meal_offer->getPrice();
        $date = $meal_offer->getDate();
        $start_time = $meal_offer->getStartTime();
        $course_option = $meal_offer->getCourseOption();

        $sql_select->bind_param("isssisiidssi", $host_id, $meal_type, $meal_name, $continent, $country, $description, $min_seat, $max_seat, $price, $date, $start_time, $course_option);

        $result = array();
        $id = null;

        $statement = $db_instance->getStatement();
        $statement->bind_result($id);

        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            array_push($result, $id);
        }
        
        return $result[0];
        
    }
    public static function getMealOffersById($id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM meal_offer WHERE id = ?;");
        $sql_select->bind_param("i", $id);
        $result = MealOfferManager::fetchMealOffer();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result;
    }
    //not finished!
    public static function getMealOffersByHost($id) {
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT * "
                . "FROM meal_offer WHERE host_id = ?;");
        $sql_select->bind_param("i", $id);
        $result = MealOfferManager::fetchMealOffer();
        $db_instance->closeStatement();
        $db_instance->closeConnection();
        
        return $result;
    }
    
    public static function fetchMealOffer(){
        $db_instance = DBManager::getInstance();
        
        $result = array();
        $statement = $db_instance->getStatement();
        
        $id = null;
        $host_id = null;
        $meal_type = null;
        $meal_name = null;
        $continent = null;
        $country = null;
        $description = null;
        $min_seat = null;
        $max_seat = null;
        $price = null;
        $date = null;
        $start_time = null;
        $course_option = null;
        $end_time = null;
        $donation_type = null;
        $number_of_donations = null;
        $currency = null;
        $tupple = null;
        $statement->bind_result($id,$meal_type,$meal_name,$continent,$country,$description,$min_seat,$max_seat,$price,$date,$start_time,$course_option,$end_time,$donation_type,$number_of_donations,$currency,$host_id);
        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple = new MealOffer($id,$host_id,$meal_type,$meal_name,$continent,$country,$description,$min_seat,$max_seat,$price,$date,$start_time,$course_option,$end_time,$donation_type,$number_of_donations,$currency);
            array_push($result, $tupple);
        }
        
        return $result;
    }

    public static function getTop4HostIds(){
        $db_instance = DBManager::getInstance();
        
        $db_instance->connect();
        $sql_select = $db_instance->prepare("SELECT host_id, SUM(number_of_donations) as number_of_donations_per_host FROM meal_offer GROUP BY host_id ORDER BY number_of_donations_per_host DESC Limit 4");
        
        $result = array();
        $id = null;
        $number_of_donations = null;
        $statement = $db_instance->getStatement();
        $statement->bind_result($id,$number_of_donations);

        $db_instance->executeStatement();
        
        while($db_instance->fetchResult()){
            $tupple["host_id"] =  $id;
            $tupple["num"] = $number_of_donations;
            array_push($result, $tupple);
        }
        
        return $result;

    }
}
