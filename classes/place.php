<?php

require_once 'exceptions.php';

class Place extends Connection {
    
    private $id;
    private $logo;
    private $name;
    private $latitude;
    private $longitude;
    private $addressLine;
    private $zip;
    private $city;
    private $email;
    private $phone;
    private $web;
    private $franchise;
    
    public function get_id(){return $this->id;}
    public function get_logo(){return $this->logo;}
    public function get_name(){return $this->name;}
    public function get_latitude(){return $this->latitude;}
    public function get_longitude(){return $this->longitude;}
    public function get_addressLine(){return $this->addressLine;}
    public function get_zip(){return $this->zip;}
    public function get_city(){return $this->city;}
    public function get_email(){return $this->email;}
    public function get_phone(){return $this->phone;}
    public function get_web(){return $this->web;}
    public function get_franchise(){return $this->franchise;}
    
    public function set_logo($value){$this->logo = $value;}
    public function set_name($value){$this->name = $value;}
    public function set_latitude($value){$this->latitude = $value;}
    public function set_longitude($value){$this->longitude = $value;}
    public function set_addressLine($value){$this->addressLine = $value;}
    public function set_zip($value){$this->zip = $value;}
    public function set_city($value){$this->city = $value;}
    public function set_email($value){$this->email = $value;}
    public function set_phone($value){$this->phone = $value;}
    public function set_web($value){$this->web = $value;}
    public function set_franchise($value){$this->franchise = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->logo = '';
            $this->name = '';
            $this->latitude = 0;
            $this->longitude = 0;
            $this->addressLine = '';
            $this->zip = '';
            $this->city = new City();
            $this->email = '';
            $this->phone = '';
            $this->web = '';
            $this->franchise = new Franchise();
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select * from Places where place_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('i', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->lgo, $this->name, $this->latitude, $this->longitude, $this->addressLine, $this->zip, $this->city, $this->email, $this->phone, $this->web, $this->franchise);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) {throw (new RecordNotFoundException());}
        }
    }
    
    public function getDistance($lat, $lng){
        $distance = ( 6371 * acos((cos(deg2rad($this->latitude)) ) * (cos(deg2rad($lat))) * (cos(deg2rad($lng) - deg2rad($this->longitude)) )+ ((sin(deg2rad($this->latitude))) * (sin(deg2rad($lat))))) );
        return $distance;
    }
}
