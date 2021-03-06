<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . '/libraries/REST_Controller.php';

/**
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array
 *
 * @package         CodeIgniter
 * @subpackage      Rest Server
 * @category        Controller
 * @author          Phil Sturgeon, Chris Kacerguis
 * @license         MIT
 * @link            https://github.com/chriskacerguis/codeigniter-restserver
 */
class User extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();

        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['login_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_delete']['limit'] = 50; // 50 requests per hour per user/key
    }

    public function register_post()
    {
        // $this->some_model->update_user( ... );
        $message = [
            'username' => $this->post('user'),
            'password' => $this->post('pass'),
            'nama' => $this->post('nama'),
            'email' => $this->post('email')
        ];
        $this->load->model("User_model", "User");
        if($this->User->register($message)){
            $messages['status'] = TRUE;
            $messages['message'] = "Register Success!";
            $this->set_response($messages, REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
        }else{
            $messages['status'] = FALSE;
            $messages['message'] = "Register Failed!";
            $this->set_response($messages, REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
        }
    }

     public function login_post()
    {
        // $this->some_model->update_user( ... );
        $message = [
            'username' => $this->post('user'),
            'password' => $this->post('pass')
        ];
        $this->load->model("User_model", "User");
        $this->set_response($this->User->login($message), REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
    }   

    public function users_delete()
    {
        $id = (int) $this->get('id');

        // Validate the id.
        if ($id <= 0)
        {
            // Set the response and exit
            $this->response(NULL, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
        }

        // $this->some_model->delete_something($id);
        $message = [
            'id' => $id,
            'message' => 'Deleted the resource'
        ];

        $this->set_response($message, REST_Controller::HTTP_NO_CONTENT); // NO_CONTENT (204) being the HTTP response code
    }

}
