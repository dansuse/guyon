<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	function __construct() {
        parent::__construct();
        $this->load->helper('url');
		$this->load->helper('form');
    }
	public function index(){
		$this->load->view('viewHome');
	}
	public function documentation(){
		$this->load->view('viewDocumentation');
	}
	public function pricing(){
		$this->load->view('viewPricing');
	}
	public function register(){
		$this->load->view('viewRegister');
	}
	public function handle(){
		if($this->input->post('rRegister')){
			$this->form_validation->set_rules('rEmail','Email','required|valid_email');
			$this->form_validation->set_rules('rUsername','Username','required');
			$this->form_validation->set_rules('rPassword','Password','required');
			$this->form_validation->set_rules('rConfirm','Password Confirmation','required|matches[rPassword]');
			if($this->form_validation->run()){
				$email = $this->input->post("rEmail");
				$user = $this->input->post("rUsername");
				$pass = $this->input->post("rPassword");
				$nama = $this->input->post("rNama");
				$this->load->model("User");
				$this->User->register(array("username"=>$user, "email"=> $email, "password"=> $pass, "nama"=>$nama));
				$this->load->view('viewRegister');
			}
			else{
				$this->load->view('viewRegister');
			}
		}
	}
}
