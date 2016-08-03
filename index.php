<?php
header('Access-Control-Allow-Origin:*');
require_once 'classes/country.php';
require_once 'classes/city.php';
require_once 'classes/state.php';
require_once 'classes/user.php';
require_once 'classes/franchise.php';
require_once 'classes/type.php';
require_once 'classes/role.php';
require_once 'classes/place.php';
require_once 'classes/catalogs.php';

$country = new Country('MX');
$state = new State('BC');
$city = new City(1);
$user = new User('hogi@gmail.com', 'hogi');
echo $country->get_name();
echo '/n';
echo $state->get_name();
echo '/n';
echo $city->get_name();
echo 'n\n';
$citie = new City($user->get_city());
echo  $citie->get_state();
echo ' ';
$f = new Franchise(1);
echo $f->get_name();
$t = new Type(1);
echo '\t';
echo $t->get_title();
echo ' ';
$r = new Role(1);
echo $r->get_name();
echo ' -- ';
$pla = new Place(2);
echo '  / ';
echo '  / ';
$promo = new Promotion(1);
$fran = $promo->getFranchise();
echo '  / ';
echo $fran->get_name();
echo '  / ';
echo $promo->get_title();
echo count(Catalogs::getAllPromotions());
echo $user->get_firstName();
echo $pla->get_latitude();
echo $pla->get_longitude();
echo '-------';
echo $pla->getDistance(32.560670099999996 , -116.57866770000001);



