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
class Post extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();

        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['users_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_delete']['limit'] = 50; // 50 requests per hour per user/key
    }

    public function all_get()
    {
        $this->load->model("Post_model");
        $users = $this->Post_model->get();

        $id = $this->get('id');

        // If the id parameter doesn't exist return all the users

        if ($id === NULL)
        {
            // Check if the users data store contains users (in case the database result returns NULL)
            if ($users)
            {
                // Set the response and exit
                $this->response($users, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
            }
            else
            {
                // Set the response and exit
                $this->response([
                    'status' => FALSE,
                    'message' => 'No users were found'
                ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
            }
        }

        // Find and return a single record for a particular user.

        $id = (int) $id;

        // Validate the id.
        if ($id <= 0)
        {
            // Invalid id, set the response and exit.
            $this->response(NULL, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
        }

        // Get the user from the array, using the id as key for retrieval.
        // Usually a model is to be used for this.

        $user = NULL;

        if (!empty($users))
        {
            foreach ($users as $key => $value)
            {
                if (isset($value['id']) && $value['id'] === $id)
                {
                    $user = $value;
                }
            }
        }

        if (!empty($user))
        {
            $this->set_response($user, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->set_response([
                'status' => FALSE,
                'message' => 'User could not be found'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function get_get()
    {
        $id = $this->get("id");

        $this->load->model("Post_model");
        $data = $this->Post_model->get_post($id);

        if ($id !== NULL)
        {
            if ($data)
            {
                $this->response($data, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'No post were found'
                ], REST_Controller::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid parameter'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function most_get()
    {
        $this->load->model("Post_model");
        $data = $this->Post_model->most_post();

        if ($data)
        {
            $this->response($data, REST_Controller::HTTP_OK);
        }
        else
        {
            $this->response([
                'status' => FALSE,
                'message' => 'No post were found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function user_get()
    {
        $id = $this->get("id");
        $this->load->model("Post_model");
        $data = $this->Post_model->get_from_user($id);
        if($id === NULL){
            $this->response([
                    'status' => FALSE,
                    'message' => 'No parameter found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
        if ($data)
            {
                $this->response($data, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'No post were found'
                ], REST_Controller::HTTP_NOT_FOUND);
            }
    }

    public function random_get()
    {
        $this->load->model("Post_model");
        $data = $this->Post_model->random();

        if ($data)
            {
                $this->response($data, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'No post were found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function upvote_post()
    {
        $id = $this->post("id");
        $username = $this->post("username");
        $this->load->model("Post_model");
        $data = $this->Post_model->vote($id, $username, 1);

        if ($data)
            {
                $this->response($data, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function downvote_post()
    {
        $id = $this->post("id");
        $username = $this->post("username");
        $this->load->model("Post_model");
        $data = $this->Post_model->vote($id, $username,-1);

        if ($data)
            {
                $this->response($data, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function comment_post()
    {
        $id = $this->post("id");
        $comment = $this->post("comment");
        $username = $this->post("username");
        $this->load->model("Post_model");
        $data = $this->Post_model->comment($id, $comment, $username);

        if ($data)
            {
                $this->response($data, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function reply_post()
    {
        $id = $this->post("id");
        $comment = $this->post("comment");
        $username = $this->post("username");
        $this->load->model("Post_model");
        $data = $this->Post_model->reply($id, $comment, $username);

        if ($data)
            {
                $this->response($data, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function upload_post(){
        $data = [
            "username" => $this->post('username'),
            "idkategori" => $this->post("category"),
            "caption" => $this->post("caption"),
            'namafile' => $_FILES['userfile']['name']
        ];
        $uploaddir = './uploads/post/';
        $file_name = underscore($_FILES['userfile']['name']);
        $uploadfile = $uploaddir.$file_name;

        if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
            $dataDB['status'] = 'success';       
            $dataDB['filename'] = $file_name;
            $this->load->model("Post_model","Post");
            $this->Post->upload($data);
            $this->response($dataDB, REST_Controller::HTTP_OK);
         } else {
            $dataDB['status'] =  'failure';  
            $this->response($dataDB, REST_Controller::HTTP_NOT_FOUND);     
         }
    }

    public function delete_delete()
    {
        $id = $this->delete('id');
        $postid = $this->delete('postid');

        if ($id == NULL || $postid == NULL)
        {
            $this->response(array("status"=>"failed","description"=>"Invalid parameter."), REST_Controller::HTTP_BAD_REQUEST);
        }

        $this->load->model("Post_model", "Post");
        $message = [
            "status" => $this->Post->delete($id, $postid)
        ];
        $this->set_response($message, REST_Controller::HTTP_NO_CONTENT); // NO_CONTENT (204) being the HTTP response code
    }

}
