<?php

require_once 'exceptions.php';

class Type extends Connection{
    private $id;
    private $title;
    
    public function get_id(){return $this->id;}
    public function get_title(){return $this->title;}
    
    public function set_title($value){$this->title = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->title = '';
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select * from Types_Places where type_place_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('i', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->title);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) {throw (new RecordNotFoundException());}
        }
    }
}
