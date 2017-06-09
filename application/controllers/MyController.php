<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MyController extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('User_model', 'user');
        $this->load->library('table');
        $this->load->model('Client_model', 'client');
    }

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

    public function token(){
        $this->oauth2->token();
    }

    public function authorize(){
        $this->oauth2->authorize();
    }
    public function tes(){
        //$expires = date('Y-m-d H:i:s', time());
        //echo phpinfo();
        //echo $expires;
        echo base64_encode(mcrypt_create_iv(80, MCRYPT_DEV_URANDOM));
    }

    public function daftaraplikasi(){
        if($this->session->userdata(SESSION_LOGIN_NOW) !== null){
            $data['data'] = $this->client->loadAll($this->session->userdata(SESSION_LOGIN_NOW)['username']);
            $this->load->view('halaman_daftar_aplikasi', $data);
        }else{
            redirect("MyController/login");
        }
        
    }

    public function handle_daftaraplikasi(){
        $rand_length = strlen($this->input->post('nama_aplikasi'));
        $rand_length = 60 - $rand_length;
        //echo $rand_length;
        $new['client_id'] = $this->input->post('nama_aplikasi') . base64_encode(mcrypt_create_iv($rand_length, MCRYPT_DEV_URANDOM));
        // echo $new['client_id'];
        // echo "<br>";
        $new['client_secret'] = base64_encode(mcrypt_create_iv(60, MCRYPT_DEV_URANDOM));
        // echo $new['client_secret'];
        $new['redirect_uri'] = $this->input->post('redirect_url');
        $new['user_id'] = $this->session->userdata(SESSION_LOGIN_NOW)['username'];
        $new['nama_aplikasi'] = $this->input->post('nama_aplikasi');
        $new['deskripsi_aplikasi'] = $this->input->post('deskripsi_aplikasi');
        
        $this->client->registerApp($new);
        redirect('MyController/daftaraplikasi');
    }

    public function login(){
        if($this->session->userdata(SESSION_LOGIN_NOW) !== null){
            redirect('MyController/daftaraplikasi');
        }else{
            $data['mode'] = "login";
            $this->load->view('halaman_login', $data);
        }
    }

    public function logout(){
        $this->session->unset_userdata(SESSION_LOGIN_NOW, $sess_data);
        redirect('MyController/login');
    }

    public function handle_login(){
        if($this->input->post('submit') !== null ){
            $this->form_validation->set_rules('username', 'Username', 'callback_cekLogin');
            $this->form_validation->set_message('cekLogin', 'Login Gagal !');

            if($this->form_validation->run()){
                $sess_data['username'] = $this->input->post('username');
                $this->session->set_userdata(SESSION_LOGIN_NOW, $sess_data);
                redirect('MyController/daftaraplikasi');
            }else{
                $data['mode'] = "login";
                $this->load->view('halaman_login', $data);
            }    
        }
    }

    public function register(){
        if($this->session->userdata(SESSION_LOGIN_NOW) !== null){
            redirect('MyController/daftaraplikasi');
        }else{
            $data['mode'] = "register";
            $this->load->view('halaman_login', $data);
        }
    }

    public function handle_register(){
        
    }

    function cekLogin($email){
        $new["username"] = $email;
        $new["password"] = $this->input->post('password');
        return $this->user->login($new);
    }
    

}
