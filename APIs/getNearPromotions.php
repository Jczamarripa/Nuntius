<?php
require_once '../classes/catalogs.php';
require_once '../classes/connection.php';
require_once '../classes/city.php';
require_once '../classes/type.php';
require_once '../classes/place.php';

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');

if(isset($_GET['lat']) & isset($_GET['lng']) & isset($_GET['dist'])){
    
    $promotions = Catalogs::getAllPromotions();
    $first = true;
    $json = '{"status" : 0, "promotions" : [';
    foreach ($promotions as $promotion){
        if($first){
            $first = false;
        }
        else{
            $json.=',';
        }
        $places = $promotion->getPlaces();
        $nearPlaces = array();
        foreach ($places as $place){
            if($place->getDistance($_GET['lat'], $_GET['lng']) <= $_GET['dist']){
                array_push($nearPlaces, $place);
            }
        }
        $json.= '{"id":'.$promotion->get_id().','
            . '"photo":"'.$promotion->get_photo().'",'
            . '"title":"'.$promotion->get_title().'",'
            . '"description":"'.$promotion->get_description().'",'
            . '"beginHour" : "'.$promotion->get_beginHour().'",'
            . '"endHour" : "'.$promotion->get_endHour().'",'
            . '"beginDate" : "'.$promotion->get_beginDate().'",'
            . '"endDate": "'.$promotion->get_endDate().'",'
            . '"places": [';
        $second = true;
        foreach($nearPlaces as $place){
            if($second){
                $second = false;
            }
            else{
                $json.=',';
            }
            $city = new City($place->get_city());
            $json.='{ "id" : '.$place->get_id().','
                    . '"logo" : "'.$place->get_logo().'",'
                    . '"name" : "'.$place->get_name().'",'
                    . '"latitude" : '.$place->get_latitude().','
                    . '"longitude" : '.$place->get_longitude().','
                    . '"addressLine" : "'.$place->get_addressLine().'",'
                    . '"zip":'.$place->get_zip().','
                    . '"city":"'.$city->get_name().'",'
                    . '"email":"'.$place->get_email().'",'
                    . '"phone":"'.$place->get_phone().'",'
                    . '"web":"'.$place->get_web().'",'
                    . '"distance" : '.$place->getDistance($_GET['lat'], $_GET['lng']).'}';
        }
        $json.=']}';
    }
    $json.=']}';
    
    echo utf8_encode($json);
}
else{
    echo '{"message": "invalid parameters"}';
}

