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

    private function _generate_key()
    {
        do
        {
            // Generate a random salt
            $salt = base_convert(bin2hex($this->security->get_random_bytes(64)), 16, 36);

            // If an error occurred, then fall back to the previous method
            if ($salt === FALSE)
            {
                $salt = hash('sha256', time() . mt_rand());
            }

            $new_key = substr($salt, 0, 40);
        }
        while ($this->_key_exists($new_key));

        return $new_key;
    }
    private function _key_exists($key)
    {
        return $this->client->cekApiKeyKembar($key) > 0;
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
            $data['data'] = $this->client->loadAll($this->session->userdata(SESSION_LOGIN_NOW));
            $this->load->view('halaman_daftar_aplikasi', $data);
        }else{
            redirect("MyController/login");
        }
        
    }

    function gen_oauth_creds() {
        // Get a whole bunch of random characters from the OS
        $fp = fopen('/dev/urandom','rb');
        $entropy = fread($fp, 32);
        fclose($fp);

        // Takes our binary entropy, and concatenates a string which represents the current time to the microsecond
        $entropy .= uniqid(mt_rand(), true);

        // Hash the binary entropy
        $hash = hash('sha512', $entropy);

        // Base62 Encode the hash, resulting in an 86 or 85 character string
        $hash = gmp_strval(gmp_init($hash, 16), 62);

        // Chop and send the first 80 characters back to the client
        return array(
            'consumer_key' => substr($hash, 0, 32),
            'shared_secret' => substr($hash, 32, 48)
        );
    }

    function crypto_rand_secure($min, $max)
    {
        $range = $max - $min;
        if ($range < 1) return $min; // not so random...
        $log = ceil(log($range, 2));
        $bytes = (int) ($log / 8) + 1; // length in bytes
        $bits = (int) $log + 1; // length in bits
        $filter = (int) (1 << $bits) - 1; // set all lower bits to 1
        do {
            $rnd = hexdec(bin2hex(openssl_random_pseudo_bytes($bytes)));
            $rnd = $rnd & $filter; // discard irrelevant bits
        } while ($rnd > $range);
        return $min + $rnd;
    }

    function getToken($length)
    {
        $token = "";
        $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        $codeAlphabet.= "abcdefghijklmnopqrstuvwxyz";
        $codeAlphabet.= "0123456789";
        $max = strlen($codeAlphabet); // edited

        for ($i=0; $i < $length; $i++) {
            $token .= $codeAlphabet[$this->crypto_rand_secure(0, $max-1)];
        }

        return $token;
    }

    public function handle_daftaraplikasi(){
        $rand_length = strlen($this->input->post('nama_aplikasi'));
        $rand_length = 28 - $rand_length;
        //echo $rand_length;
        //$new['client_id'] = $this->input->post('nama_aplikasi') . base64_encode(mcrypt_create_iv($rand_length, MCRYPT_DEV_URANDOM));
        $new['client_id'] = $this->input->post('nama_aplikasi') . $this->getToken($rand_length);
        // echo $new['client_id'];
        // echo "<br>";
        //$new['client_secret'] = base64_encode(mcrypt_create_iv(60, MCRYPT_DEV_URANDOM));
        $new['client_secret'] = $this->getToken(28);
        // echo $new['client_secret'];
        $new['redirect_uri'] = $this->input->post('redirect_url');
        $new['user_id'] = $this->session->userdata(SESSION_LOGIN_NOW)['username'];
        $new['nama_aplikasi'] = $this->input->post('nama_aplikasi');
        $new['deskripsi_aplikasi'] = $this->input->post('deskripsi_aplikasi');
        
        $this->client->registerApp($new);

        $dataApiKey["username"] = $this->session->userdata(SESSION_LOGIN_NOW)['username'];
        //echo $this->client->cekApiKeyKembar('asdasd') > 0 == false ? 'haha':'hihi';
        $dataApiKey["key"] = $this->_generate_key();
        // echo $dataApiKey["key"];
        $dataApiKey["level"] = 1;
        $dataApiKey["ignore_limits"] = 0;
        $dataApiKey["is_private_key"] = 0;
        $dataApiKey["client_id"] = $new['client_id'];
        $dataApiKey["limits"] = $this->input->post('limits');
        $this->client->insertApiKey($dataApiKey);

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
        redirect('http://localhost/SOA/index.php/home');
    }

    public function handle_login(){
        if($this->input->post('submit') !== null ){
            $this->form_validation->set_rules('username', 'Username', 'callback_cekLogin');
            $this->form_validation->set_message('cekLogin', 'Login Gagal !');

            if($this->form_validation->run()){
                $sess_data['username'] = $this->input->post('username');
                $this->session->set_userdata(SESSION_LOGIN_NOW, $sess_data['username']);
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
        $res = $this->user->login($new);
        if($res['status']){
            return $new["username"];
        }
    }
    

}
