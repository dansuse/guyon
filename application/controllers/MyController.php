<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MyController extends CI_Controller {

        public function index()
        {
		//$this->load->helper('url');

		//$this->load->view('welcome_message');

                $this->load->model("User_model", "User");
                echo $this->User->getPassword('hendynew');

                $username = $this->input->server('PHP_AUTH_USER');
                $http_auth = $this->input->server('HTTP_AUTHENTICATION');
                $password = $this->input->server('PHP_AUTH_PW');
                
                echo $username;
                echo "<br/>";
                echo $password;
                echo "<br/>";
                echo $this->input->server('HTTP_AUTHORIZATION');
                echo "<br/>";
                echo $http_auth;
                echo "<br/>";
        }
}
