<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Key_model extends CI_Model {
    function __construct(){
        parent::__construct();
        $this->load->database();
    }

    public function checkLimit($apikey){
        $data = $this->db->where("key", $apikey)->get("keys")->row();
        if(empty($data)){
            return false;
        }else{
            return $data->limits;
        }
    }

}