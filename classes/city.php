<?php
require_once 'exceptions.php';
class City extends Connection{
    
    private $id;
    private $name;
    private $state;
    
    public function get_id(){return $this->id;}
    public function get_name(){return $this->name;}
    public function get_state(){return $this->state;}
    
    public function set_name($value){$this->name = $value;}
    public function set_state($value){$this->state = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->name = '';
            $this->state = new State();
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select city_id, city_name, city_state_id from Cities where city_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('i', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->name, $this->state);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) throw (new RecordNotFoundException());
        }
    }
}
