<?php
require_once '../classes/catalogs.php';
require_once '../classes/connection.php';
require_once '../classes/city.php';
require_once '../classes/type.php';

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');

$promotions = Catalogs::getAllPromotions();
$json = '{"status":0, "promotions":[';

$first = true;
foreach ($promotions as $promotion){
    if ($first) {
        $first = false;
    }
    else{
        $json.=',';
    }
    $franchise = $promotion->getFranchise();
    $city = new City($franchise->get_city());
    $type = new Type($franchise->get_type());
    $json.= '{"id":'.$promotion->get_id().','
            . '"photo":"'.$promotion->get_photo().'",'
            . '"title":"'.$promotion->get_title().'",'
            . '"description":"'.$promotion->get_description().'",'
            . '"beginHour" : "'.$promotion->get_beginHour().'",'
            . '"endHour" : "'.$promotion->get_endHour().'",'
            . '"beginDate" : "'.$promotion->get_beginDate().'",'
            . '"endDate": "'.$promotion->get_endDate().'",'
            . '"franchise": {'
            . '"id":'.$franchise->get_id().','
            . '"name" : "'.$franchise->get_name().'",'
            . '"addressLine":"'.$franchise->get_addressLine().'",'
            . '"zip":"'.$franchise->get_zip().'",'
            . '"city":"'.$city->get_name().'",'
            . '"phone":"'.$franchise->get_phone().'",'
            . '"email":"'.$franchise->get_email().'",'
            . '"web":"'.$franchise->get_web().'",'
            . '"type":"'.$type->get_title().'"'
            . '}'
            . '}';
}

$json .= ']}';

echo utf8_encode($json);


