<?php

	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Headers: email, password');
	header('Content-Type: application/json');
	require_once('../classes/User.php');
	require_once('../classes/generatetoken.php');

	$headers =getallheaders();

	if(isset($headers['email'] )& isset($headers['password']))
	{
		try
		{
			$email =$headers['email'];
			$password=$headers['password'];
			$user =new User($email,$password);


			$json=
			'{ "status":0,
			"user":';
			$json.='{
			"id":'.$user->get_id().',
			"photo":"'.$user->get_photo().'",
			"firstName":"'.$user->get_firstName().'",
			"lastName":"'.$user->get_lastName().'",
			"dateOfBirth":"'.$user->get_dateOfBirth().'",
			"email":"'.$user->get_email().'",
			"password ":"'.$user->get_password().'",
			"cellphone ":"'.$user->get_cellphone().'",
			"gender":"'.$user->get_gender().'",
			"status":"'.$user->get_status().'",
			"city":"'.$user->get_city().'",
			"token":"'.generate_token($user->get_id()).'"
			}';
			$json.='}';


			echo($json);

		}
		catch(RecordNotFoundException $ex)
		{
			echo '{ "status" : 1, "errorMessage" : "'.$ex->get_message().'" }';
		}



	}

	else
		echo '{ "status" : 2, "errorMessage" : "Invalid Headers" }';


?>
