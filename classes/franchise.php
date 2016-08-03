<?php
require_once 'exceptions.php';

class Franchise extends Connection{
    private $id;
    private $name;
    private $addressLine;
    private $zip;
    private $city;
    private $phone;
    private $email;
    private $web;
    private $type;
    
    public function get_id(){return $this->id;}
    public function get_name(){return $this->name;}
    public function get_addressLine(){return $this->addressLine;}
    public function get_zip(){return $this->zip;}
    public function get_city(){return $this->city;}
    public function get_phone(){return $this->phone;}
    public function get_email(){return $this->email;}
    public function get_web(){return $this->web;}
    public function get_type(){return $this->type;}
    
    public function set_id($value){$this->id = $value;}
    public function set_name($value){$this->name = $value;}
    public function set_addressLine($value){$this->addressLine = $value;}
    public function set_zip($value){$this->zip = $value;}
    public function set_city($value){$this->city = $value;}
    public function set_phone($value){$this->phone = $value;}
    public function set_email($value){$this->email = $value;}
    public function set_web($value){$this->web = $value;}
    public function set_type($value){$this->type = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->name = '';
            $this->addressLine = '';
            $this->zip = '';
            $this->city = new City();
            $this->phone = '';
            $this->email = '';
            $this->web = '';
            $this->type = new Type();
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select * from Franchises where franchise_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('i', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->name, $this->addressLine, $this->zip, $this->city, $this->phone, $this->email, $this->web, $this->type);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) {throw (new RecordNotFoundException());}
        }
    }
}
