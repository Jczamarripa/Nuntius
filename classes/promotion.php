<?php
require_once 'exceptions.php';
require_once 'connection.php';
require_once 'franchise.php';
class Promotion extends Connection{
    
    private $id;
    private $photo;
    private $title;
    private $description;
    private $beginHour;
    private $endHour;
    private $beginDate;
    private $endDate;
    
    public function get_id(){return $this->id;}
    public function get_photo(){return $this->photo;}
    public function get_title(){return $this->title;}
    public function get_description(){return $this->description;}
    public function get_beginHour(){return $this->beginHour;}
    public function get_endHour(){return $this->endHour;}
    public function get_beginDate(){return $this->beginDate;}
    public function get_endDate(){return $this->endDate;}
    
    public function set_photo($value){$this->photo = $value;}
    public function set_title($value){$this->title = $value;}
    public function set_description($value){$this->description = $value;}
    public function set_beginHour($value){$this->beginHour = $value;}
    public function set_endHour($value){$this->endHour = $value;}
    public function set_beginDate($value){$this->beginDate = $value;}
    public function set_endDate($value){$this->endDate = $value;}
    
    function __construct() {
        if(func_num_args() == 0){
            $this->photo = '';
            $this->title = '';
            $this->description = '';
            $this->beginHour = '';
            $this->endHour = '';
            $this->beginDate = '';
            $this->endDate = '';
        }
        if(func_num_args() == 1){
            $args = func_get_args();
            $id = $args[0];
            parent::open_connection();
            $query = 'select promotion_id, promotion_photo, promotion_title, promotion_description, promotion_begin_hour, promotion_end_hour, promotion_begin_date, promotion_end_date from Promotions where promotion_id = ?';
            $cmd = parent::$connection->prepare($query);
            $cmd->bind_param('i', $id);
            $cmd->execute();
            $cmd->bind_result($this->id, $this->photo, $this->title, $this->description, $this->beginHour, $this->endHour, $this->beginDate, $this->endDate);
            $found = $cmd->fetch();
            mysqli_stmt_close($cmd);
            parent::close_connection();
            if(!$found) {throw (new RecordNotFoundException());}
        }
    }
    
    public function getPlaces(){
        parent::open_connection();
        $ids = array();
        $list = array();
        $query = 'select distinct(promotion_place_place_id) from promotions_places where promotion_place_promotion_id = ?';
        $cmd = parent::$connection->prepare($query);
        $cmd->bind_param('i', $this->id);
        $cmd->execute();
        $cmd->bind_result($id);
        while($cmd->fetch()){
            array_push($ids, $id);
        }
        mysqli_stmt_close($cmd);
        parent::close_connection();
        for($i = 0; $i < count($ids); $i++){
            array_push($list, new Place($ids[$i]));
        }
        return $list;
    }
    
    public function getFranchise(){
        parent::open_connection();
        $id;
        $query = 'select distinct(franchise_id) from Franchises inner join Places on franchise_id = place_franchise_id inner join Promotions_Places on place_id = promotion_place_place_id where promotion_place_promotion_id = ?';
        $cmd = parent::$connection->prepare($query);
        $cmd->bind_param('i', $this->id);
        $cmd->execute();
        $cmd->bind_result($id);
        $cmd->fetch();
        mysqli_stmt_close($cmd);
        parent::close_connection();
        return new Franchise($id);
    }
}
