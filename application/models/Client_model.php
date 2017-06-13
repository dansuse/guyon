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
        return $this->db->select('oauth_clients.client_id, oauth_clients.client_secret, oauth_clients.redirect_uri, oauth_clients.nama_aplikasi, oauth_clients.deskripsi_aplikasi, keys.limits, keys.key')->from('oauth_clients')
            ->join('keys', 'oauth_clients.client_id = keys.client_id')
            ->where('oauth_clients.user_id', $username)
            ->get()->result();
    }

    public function insertApiKey($dataApiKey){
        $this->db->insert("keys", $dataApiKey);
    }

    public function cekApiKeyKembar($apikey){
        return $this->db->where('key', $apikey)->count_all_results('keys');
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