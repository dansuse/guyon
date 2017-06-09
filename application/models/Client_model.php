<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Client_model extends CI_Model {
    function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->model("Safe_model", "Safe");
    }

    public function registerApp($new){
        $this->db->insert("oauth_clients", $new);
    }

    public function loadAll($username){
        return $this->db->select('client_id, client_secret, redirect_uri, nama_aplikasi, deskripsi_aplikasi')->where('user_id', $username)->get("oauth_clients")->result();
    }

    public function login($new){
        $data = $this->db->where("username", $new['username'])->get("user")->row();
        if(empty($data)){
            return false;
        }else{
            $hash = $data->hash;
            $loginPass = $new['password'];
            $pass = $this->Safe->decrypt($data->password, $hash);
            if($loginPass == $pass){
                return true;
            }else{
                return false;
            }
        }
    }

    public function getPassword($username){
        $data = $this->db->where("username", $username)->get("user")->row();
        if(empty($data)){
            return false;
        }else{
            $hash = $data->hash;
            $pass = $this->Safe->decrypt($data->password, $hash);
            return $pass;
        }
    }

    public function checkUsernameValid($username){
        $data = $this->db->where("username", $username)->get("user")->row();
        if(empty($data)){
            return false;
        }else{
            $api_key = $this->db->where("username", $username)->get("keys")->row();
            if(empty($api_key)){
                return "make new key";
            }else{
                return $api_key->key;
            }
            
        }
    }

}