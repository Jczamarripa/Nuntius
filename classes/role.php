<?php
require_once 'exceptions.php';
class Role extends Connection{
    
    private $id;
    private $name;
    
    public function get_id(){return $this->id;}
    public function get_name(){return $this->name;}
    
    public function set_name($value){$this->name = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->name = '';
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select * from Roles where role_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('i', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->name);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) {throw (new RecordNotFoundException());}
        }
    }
}
