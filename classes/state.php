<?php
require_once 'exceptions.php';
class State extends Connection{
    private $id;
    private $name;
    private $country;
    
    public function get_id(){return $this->id;}
    public function get_name(){return $this->name;}
    public function get_country(){return $this->country;}
    
    public function set_name($value){$this->name = $value;}
    public function set_country($value){$this->country = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->name = "";
            $this->country = new Country();
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select * from States where state_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('s', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->name, $this->country);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) throw (new RecordNotFoundException());
        }
        
    }
}
