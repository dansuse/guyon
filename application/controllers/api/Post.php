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
        $this->load->model("Post_model");
        $this->load->model("Key_model");
        if(!isset($this->_apiuser))
            return 0;
        $limits = $this->Key_model->checkLimit($this->_apiuser->key);
        if($limits == false){
            $this->methods = [
                'all_get' => ['level' => 1, 'limit' => 0],
                'trending_get' => ['level' => 1, "limit" => 0],
                'hot_get' => ['level' => 1, "limit" => 0],
                'fresh_get' => ['level' => 1, "limit" => 0],
                'explore_get' => ['level' => 1, "limit" => 0],
                'get_get' => ['level' => 1, "limit" => 0],
                'edit_caption_post' => ['level' => 1, "limit" => 0],
                'most_get' => ['level' => 1, "limit" => 0],
                'user_get' => ['level' => 1, "limit" => 0],
                'report_post' => ['level' => 1, "limit" => 0],
                'upvote_reply_post' => ['level' => 1, "limit" => 0],
                'downvote_reply_post' => ['level' => 1, "limit" => 0],
                'upvote_comment_post' => ['level' => 1, "limit" => 0],
                'downvote_comment_post' => ['level' => 1, "limit" => 0],
                'upvote_post' => ['level' => 1, "limit" => 0],
                'downvote_post' => ['level' => 1, "limit" => 0],
                'comment_post' => ['level' => 1, "limit" => 0],
                'reply_post' => ['level' => 1, "limit" => 0],
                'upload_post' => ['level' => 1, "limit" => 0],
                'delete_delete' => ['level' => 1, "limit" => 0],
                'memegen_templates_get' => ['level' => 1, "limit" => 0],
                'memegen_fonts_get' => ['level' => 1, "limit" => 0],
                'memegen_create_meme_get' => ['level' => 1, "limit" => 0]
            ];
        }else{
            $this->methods = [
                'all_get' => ['level' => 1, 'limit' => $limits],
                'trending_get' => ['level' => 1, "limit" => $limits],
                'hot_get' => ['level' => 1, "limit" => $limits],
                'fresh_get' => ['level' => 1, "limit" => $limits],
                'explore_get' => ['level' => 1, "limit" => $limits],
                'get_get' => ['level' => 1, "limit" => $limits],
                'edit_caption_post' => ['level' => 1, "limit" => $limits],
                'most_get' => ['level' => 1, "limit" => $limits],
                'user_get' => ['level' => 1, "limit" => $limits],
                'report_post' => ['level' => 1, "limit" => $limits],
                'upvote_reply_post' => ['level' => 1, "limit" => $limits],
                'downvote_reply_post' => ['level' => 1, "limit" => $limits],
                'upvote_comment_post' => ['level' => 1, "limit" => $limits],
                'downvote_comment_post' => ['level' => 1, "limit" => $limits],
                'upvote_post' => ['level' => 1, "limit" => $limits],
                'downvote_post' => ['level' => 1, "limit" => $limits],
                'comment_post' => ['level' => 1, "limit" => $limits],
                'reply_post' => ['level' => 1, "limit" => $limits],
                'upload_post' => ['level' => 1, "limit" => $limits],
                'delete_delete' => ['level' => 1, "limit" => $limits],
                'memegen_templates_get' => ['level' => 1, "limit" => $limits],
                'memegen_fonts_get' => ['level' => 1, "limit" => $limits],
                'memegen_create_meme_get' => ['level' => 1, "limit" => $limits]
            ];
        }
    }

    public function all_get()
    {
        $data['start'] = $this->get("start");
        $data['end'] = $this->get("end");
        if($this->get("user")){
            $data['user'] = $this->get("user");
        }else{
            $data['user'] = "";
        }

        
        $res = $this->Post_model->get($data);
        if (!empty($res))
        {
            $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->set_response([
                'status' => FALSE,
                'message' => 'User could not be found'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function trending_get()
    {
        $data['start'] = $this->get("start");
        $data['end'] = $this->get("end");
        if($this->get("user")){
            $data['user'] = $this->get("user");
        }else{
            $data['user'] = "";
        }

        
        $res = $this->Post_model->get_trending($data);
        if (!empty($res))
        {
            $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->set_response([
                'status' => FALSE,
                'message' => 'User could not be found'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function hot_get()
    {
        $data['start'] = $this->get("start");
        $data['end'] = $this->get("end");
        if($this->get("user")){
            $data['user'] = $this->get("user");
        }else{
            $data['user'] = "";
        }
        
        $res = $this->Post_model->get_hot($data);
        if (!empty($res))
        {
            $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->set_response([
                'status' => FALSE,
                'message' => 'Data not found'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function fresh_get()
    {
        $data['start'] = $this->get("start");
        $data['end'] = $this->get("end");
        if($this->get("user")){
            $data['user'] = $this->get("user");
        }else{
            $data['user'] = "";
        }

        
        $res = $this->Post_model->get_fresh($data);
        if (!empty($res))
        {
            $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->set_response([
                'status' => FALSE,
                'message' => 'User could not be found'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function explore_get()
    {
        $res = $this->Post_model->explore();
        if (!empty($res))
        {
            $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->set_response([
                'status' => FALSE,
                'message' => 'Data not found'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function kategori_get()
    {
        $data['kategori'] = $this->get("id");
        $data['user'] = $this->get("user");
        $data['start'] = $this->get("start");   
        $data['end'] = $this->get("end");

        
        $res = $this->Post_model->get_by_kategori($data);
        if (!empty($res))
        {
            $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
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

    public function edit_caption_post(){
        $id = $this->post("id");
        $newCaption = $this->post("caption");
        $data = $this->Post_model->edit_caption_post($id, $newCaption);
        $this->response($data, REST_Controller::HTTP_OK);
    }

    public function most_get()
    {
        
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
        $data['user'] = $this->get("username");
        $data['start'] = $this->get("start");
        $data['end'] = $this->get("end");
        
        $data = $this->Post_model->get_from_user($data);
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
        $data['user'] = $this->get("user");
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

    public function report_post()//_post artinya menggunakan method post REST API
    {
        $id = $this->post("id");
        $username = $this->post("username");
        $cause = $this->post("report");
        
        $data = $this->Post_model->report_post($id, $username,$cause);

        if ($data["status"])
        {
            $this->response($data, REST_Controller::HTTP_OK);
        }
        else
        {
            $this->response($data, REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function upvote_reply_post()
    {
        $id = $this->post("id");
        $username = $this->post("username");
        
        $data = $this->Post_model->vote_reply($id, $username, 1);

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

    public function downvote_reply_post()
    {
        $id = $this->post("id");
        $username = $this->post("username");
        
        $data = $this->Post_model->vote_reply($id, $username,-1);

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

    public function upvote_comment_post()
    {
        $id = $this->post("id");
        $username = $this->post("username");
        
        $data = $this->Post_model->vote_comment($id, $username, 1);

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

    public function downvote_comment_post()
    {
        $id = $this->post("id");
        $username = $this->post("username");
        
        $data = $this->Post_model->vote_comment($id, $username,-1);

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

    public function upvote_post()
    {
        $id = $this->post("id");
        $username = $this->post("username");
        
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

    public function comment_get(){
        $id = $this->get("id");
        $user = ($this->get("username")) ? $this->get("username") : "";
        
        $data = $this->Post_model->get_comment($id, $user);

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
        //id = id comment
        $id = $this->post("id");
        $comment = $this->post("comment");
        $username = $this->post("username");
        
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
            "idkategori" => $this->post("idkategori"),
            "caption" => $this->post("caption"),
            'namafile' => $_FILES['userfile']['name']
        ];
        $uploaddir = './uploads/post/';
        $file_name = underscore($_FILES['userfile']['name']);
        $uploadfile = $uploaddir.$file_name;

        if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
            $dataDB['status'] = 'success';       
            $dataDB['filename'] = $file_name;
            
            $this->Post_model->upload($data);
            $this->response($dataDB, REST_Controller::HTTP_OK);
         } else {
            $dataDB['status'] =  'failure';  
            $this->response($dataDB, REST_Controller::HTTP_NOT_FOUND);     
         }
    }

    public function delete_post()
    {
        $id = $this->post('username');
        $postid = $this->post('id');

        $this->load->model("Post_model", "Post");
        $message = $this->Post_model->delete($id, $postid);
        $this->set_response($message, REST_Controller::HTTP_OK); // NO_CONTENT (204) being the HTTP response code
    }

    public function memegen_templates_get(){
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_URL => 'https://memegen.link/api/templates/'
        ));
        $hasil = curl_exec($curl);
        $this->set_response(json_decode($hasil), REST_Controller::HTTP_OK);
    }

    public function memegen_fonts_get(){
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_URL => 'https://memegen.link/api/fonts/'
        ));
        $hasil = curl_exec($curl);
        $this->set_response(json_decode($hasil), REST_Controller::HTTP_OK);
    }

    public function memegen_create_meme_get(){
        $gambar = $this->get("gambar");
        $text1 = $this->get("text1");
        $text2 = $this->get("text2");
        $font = $this->get("font");
        $width = $this->get("width");
        $height = $this->get("height");
        
        $ctr = 0;

        $url_final = "https://memegen.link/";
        if(is_null($gambar) || empty($gambar) || $gambar == ""){
            $this->set_response("Parameter gambar wajib", REST_Controller::HTTP_BAD_REQUEST);
        }else{
            $url_final .= $gambar;
        }

        if(is_null($text1) || empty($text1) || $text1 == ""){
            $this->set_response("Parameter text1 wajib", REST_Controller::HTTP_BAD_REQUEST);
        }else{
            $url_final .= "/" . $text1;
        }

        if(is_null($text2) || empty($text2) || $text2 == ""){
            $this->set_response("Parameter text2 wajib", REST_Controller::HTTP_BAD_REQUEST);
        }else{
            $url_final .= "/" . $text2 . ".jpg";
        }

        if(!(is_null($font) || empty($font) || $font == "")){
            if($ctr == 0){
                $url_final .= "?" . "font=" . $font;    
            }else{
                $url_final .= "&" . "font=" . $font;    
            }
            $ctr++;
        }

        if(!(is_null($width) || empty($width) || $width == "")){
            if($ctr == 0){
                $url_final .= "?" . "width=" . $width;    
            }else{
                $url_final .= "&" . "width=" . $width;    
            }
            $ctr++;
        }

        if(!(is_null($height) || empty($height) || $height == "")){
            if($ctr == 0){
                $url_final .= "?" . "height=" . $height;    
            }else{
                $url_final .= "&" . "height=" . $height;    
            }
            $ctr++;
        }

        $this->set_response($url_final, REST_Controller::HTTP_OK);
    }

}
