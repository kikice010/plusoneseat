<?php

class DBManager {
 
    protected $database;
    protected $username;
    protected $password;
    protected $hostname;
    protected $connection;
    protected $statement;
    
    private static $instance;
    
    public static function getInstance(){
        if(!isset(self::$instance)) { 
            $c = __CLASS__; 
            self::$instance = new $c(); 
        } 
        return self::$instance; 
    }
    
    
    function __construct(){
        $this->database = "plusoneseat";
        $this->username = "plusoneseat";
        $this->password = "p1s";//set password
        // $this->hostname = "localhost"; //uncomment before push on server
        $this->hostname = "localhost:3301"; //comment before push on server
    }
    
    
    function __destruct(){
        $this->closeConnection();
    }
    
    public function getConnection(){
        return $this->connection;
    } 
    
    public function getStatement(){
        return $this->statement;
    }

    public function prepare($statement)
    {
        if(!($this->statement = $this->connection->prepare($statement))){
            echo "Prepare failed:<br>";
            echo "Errno: " . $this->connection->errno . "<br>";
            echo "Error: " . $this->connection->error . "<br>";
        }
        else{
            return $this->statement;
        }        
    }

    public function executeStatement(){
        $exec_res = $this->statement->execute();
        if(!$exec_res){
            echo "Prepare failed: <br>";
            echo "Errno: " . $this->connection->errno . "<br>";
            echo "Error: " . $this->connection->error . "<br>";
        }
    }
    
    public function fetchResult(){
        return $this->statement->fetch();
    }
    
    public function closeStatement(){
        $this->statement->close();
        $this->statement =null;
    }

    
    public function connect() {
        $this->CloseConnection();
        
        $this->connection = mysqli_connect($this->hostname, $this->username, $this->password, $this->database);
        if ($this->connection->connect_errno) {
            echo "Sorry, the website is experiencing problems.";
            echo "Error: Failed to make a MySQL connection: <br>";
            echo "Errno: " . $this->connection->connect_errno . "<br>";
            echo "Error: " . $this->connection->connect_error . "<br>";
        }
    }
 
    
    // Closes the connections
    public function closeConnection(){
        if($this->connection){
            mysqli_close($this->connection);
            $this->connection = null;
        }
    }
    
 
}


?>



