<?php
require_once 'exceptions.php';
require_once 'promotion.php';
class Catalogs extends Connection{
    public static function getAllPromotions(){
        parent::open_connection();
        $ids = array();
        $list = array();
        $query = 'select promotion_id from Promotions where date(promotion_begin_date) >= current_date() or date(promotion_end_date) >= date(promotion_begin_date) and date(promotion_end_date) >= current_date()';
        $cmd = parent::$connection->prepare($query);
        $cmd->execute();
        $cmd->bind_result($id);
        while($cmd->fetch()){
            array_push($ids, $id);
        }
        mysqli_stmt_close($cmd);
        parent::close_connection();
        for($i = 0; $i < count($ids); $i++){
            array_push($list, new Promotion($ids[$i]));
        }
        return $list;
    }
}
