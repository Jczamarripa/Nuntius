<?php

require_once 'exceptions.php';
require_once 'connection.php';
class Country extends Connection{
    //attributes
    private $id;
    private $name;
    
    //getters
    public function get_id(){return $this->id;}
    public function get_name(){return $this->name;}
    
    //setters
    public function set_id($value){$this->id = $value;}
    public function set_name($value){$this->name = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->name = '';
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select country_id, country_name from Countries where country_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('s', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->name);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) throw (new RecordNotFoundException());
        }
    }
}
