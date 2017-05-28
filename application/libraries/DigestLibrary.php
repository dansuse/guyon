<?php
class DigestLibrary {
	public function auth($username, $password)
	{
		$rest_realm = "REST API";
		$CI = CI_Controller::get_instance();
		$CI->load->model("User_model", "User");
		$pass_db = $CI->User->getPassword($username);

		return md5($username.':'.$rest_realm.':'.(($pass_db != FALSE) ? $pass_db : ''));
	}
}