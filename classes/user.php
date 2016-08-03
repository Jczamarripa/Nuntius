<?php
require_once ('exceptions.php');
require_once ('connection.php');
class User extends Connection{
    private $id;
    private $photo;
    private $firstName;
    private $lastName;
    private $dateOfBirth;
    private $email;
    private $password;
    private $cellphone;
    private $gender;
    private $status;
    
    public function get_id(){return $this->id;}
    public function get_photo(){return $this->photo;}
    public function get_firstName(){return $this->firstName;}
    public function get_lastName(){return $this->lastName;}
    public function get_dateOfBirth(){return $this->dateOfBirth;}
    public function get_email(){return $this->email;}
    public function get_password(){return $this->password;}
    public function get_cellphone(){return $this->cellphone;}
    public function get_gender(){return $this->gender;}
    public function get_status(){return $this->status;}
    public function get_city(){return $this->city;}
    
    public function set_id($value){$this->id = $value;}
    public function set_photo($value){$this->photo = $value;}
    public function set_firstName($value){$this->firstName = $value;}
    public function set_lastName($value){$this->lastName = $value;}
    public function set_dateOfBirth($value){$this->dateOfBirth = $value;}
    public function set_email($value){$this->email = $value;}
    public function set_password($value){$this->password = $value;}
    public function set_cellphone($value){$this->cellphone = $value;}
    public function set_gender($value){$this->gender = $value;}
    public function set_status($value){$this->status = $value;}
    public function set_city($value){$this->city = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->photo = '';
            $this->firstName = '';
            $this->lastName = '';
            $this->dateOfBirth = '';
            $this->email = '';
            $this->password = '';
            $this->cellphone = '';
            $this->gender = '';
            $this->status = '';
            $this->city = new City();
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select * from Users where user_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('i', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->photo, $this->firstName, $this->lastName, $this->dateOfBirth, $this->email, $this->password, $this->cellphone, $this->gender, $this->status, $this->city);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) {throw (new RecordNotFoundException());}
        }
        if(func_num_args() == 2){
            $args = func_get_args();
            $email = $args[0];
            $password = $args[1];
            parent::open_connection();
            $query = 'select * from Users where user_email = ? and user_password = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('ss', $email, $password);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->photo, $this->firstName, $this->lastName, $this->dateOfBirth, $this->email, $this->password, $this->cellphone, $this->gender, $this->status, $this->city);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) {throw (new RecordNotFoundException());}
        }
    }
}
