<?php
class BasicAuthLibrary {
	public function auth($username, $password)
	{
		$CI = CI_Controller::get_instance();
		$CI->load->model("User_model", "User");
		$pass_db = $CI->User->getPassword($username);
		
		if($pass_db == false){
			return false;	
		}else if($pass_db == $password){
			return true;
		}else if($pass_db != $password){
			return false;
		}
	}
}