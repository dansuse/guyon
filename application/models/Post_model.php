<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Post_model extends CI_Model {
    function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->helper("url");
        $this->load->model("Safe_model", "Safe");
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
    }

    public function get_post($id){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where(array("id"=>$newId,"status"=>1))->get("post")->row();
        if($data){
            $data->id = $this->Safe->encrypt($data->id, $salt);
            $data->namafile = base_url() . "uploads/post/" . $data->namafile;
            return $data;
        }
        return NULL;
    }

    public function edit_caption_post($id, $newCaption){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where(array("id"=>$newId,"status"=>1))->get("post")->row();
        if($data){
            $this->db->where("id",$newId)->update("post",array("caption"=>$newCaption));
            return [
                'status' => TRUE,
                'message' => 'Edit caption success'
            ];
        }
        return [
            'status' => FALSE,
            'message' => 'Edit caption failed'
        ];
    }    

    public function get(){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $data = $this->db->where("status",1)->get("post")->result();
        foreach ($data as $d) {
            $d->id = $this->Safe->encrypt($d->id, $salt);
            $d->namafile = base_url() . "uploads/post/" . $d->namafile;
        }
        return $data;
    }

    public function most_post(){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $data = $this->db->limit(1)->order_by("comment_count","DESC")->where("status",1)->get("post")->row();
        $data->id = $this->Safe->encrypt($data->id, $salt);
        return $data;
    }

    public function get_from_user($user){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $data = $this->db->where("username",$user)->get("post")->result();
        foreach ($data as $d) {
            $d->id = $this->Safe->encrypt($d->id, $salt);
        }
        return $data;
    } 

    public function random(){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $data = $this->db->order_by('rand()')->limit(1)->get("post")->row();
        $data->id = $this->Safe->encrypt($data->id, $salt);
        return $data;
    }

    public function delete($id, $postid){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($postid, $salt);
        $where = [
            "username" => $id,
            "id" => $postid
        ];
        $data = $this->db->where($where)->get("post")->row();
        if($data){
            $this->db->delete("post", $where);
            return "success";
        }
        return "fail";
    }

    //_post tidak berarti menggunakan method post REST API
    //post disini artinya postingan
    public function report_post($id, $username, $cause){//id post
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where("id", $newId)->get("post")->row();
        if($data){
            $this->db->where("id", $newId)->update("post", array("status"=>"0"));
            $arr = [
                "idPost"=>$newId,
                "username"=>$username,
                "cause"=>$cause
            ];
            $this->db->insert("report",$arr);
            return [
                'status' => TRUE,
                'message' => 'Report post success'
            ];
        }
        return [
                'status' => FALSE,
                'message' => 'Report post failed. Post not found!'
            ];
    }

    public function vote_reply($id, $username, $vote){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where("id",$newId)->get("reply")->row();
        if($data){
            $data2 = $this->db->where(array("idreply"=>$newId,"username"=>$username))->get("reply_like")->row();
            if(empty($data2)){
                $this->db->where("id",$newId)->update("reply",array("like_count"=>$data->like_count+$vote));
                $arr = [
                    "idReply"=>$newId,
                    "username"=>$username,
                    "status"=>$vote
                ];
                $this->db->insert("reply_like",$arr);
                return [
                    'status' => TRUE,
                    'message' => 'Vote reply success'
                ];
            }else if($data2->status != $vote){
                $this->db->where("id",$newId)->update("reply",array("like_count"=>$data->like_count+$vote * 2));
                $this->db->where("id",$data2->id)->update("reply_like",array("status"=>$vote));
                return [
                    'status' => TRUE,
                    'message' => 'Vote reply success'
                ];
            }
        }
        return [
            'status' => FALSE,
            'message' => 'Invalid ID Reply'
        ];;
    }

    public function vote_comment($id, $username, $vote){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where("id",$newId)->get("comment")->row();
        if($data){
            $data2 = $this->db->where(array("idcomment"=>$newId,"username"=>$username))->get("comment_like")->row();
            if(empty($data2)){
                $this->db->where("id",$newId)->update("comment",array("like_count"=>$data->like_count+$vote));
                $arr = [
                    "idComment"=>$newId,
                    "username"=>$username,
                    "status"=>$vote
                ];
                $this->db->insert("comment_like",$arr);
                return [
                    'status' => TRUE,
                    'message' => 'Vote comment success'
                ];
            }else if($data2->status != $vote){
                $this->db->where("id",$newId)->update("comment",array("like_count"=>$data->like_count+$vote * 2));
                $this->db->where("id",$data2->id)->update("comment_like",array("status"=>$vote));
                return [
                    'status' => TRUE,
                    'message' => 'Vote comment success'
                ];
            }
        }
        return [
            'status' => FALSE,
            'message' => 'Invalid ID Comment'
        ];;
    }

    public function vote($id, $username, $vote){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where("id",$newId)->get("post")->row();
        if($data){
            $data2 = $this->db->where(array("idpost"=>$newId,"username"=>$username))->get("like")->row();
            if(empty($data2)){
                $this->db->where("id",$newId)->update("post",array("like_count"=>$data->like_count+$vote));
                $arr = [
                    "idPost"=>$newId,
                    "username"=>$username,
                    "status"=>$vote
                ];
                $this->db->insert("like",$arr);
                return [
                    'status' => TRUE,
                    'message' => 'Vote success'
                ];
            }else if($data2->status != $vote){
                $this->db->where("id",$newId)->update("post",array("like_count"=>$data->like_count+$vote * 2));
                $this->db->where("id",$data2->id)->update("like",array("status"=>$vote));
                return [
                    'status' => TRUE,
                    'message' => 'Vote success'
                ];
            }
        }
        return [
            'status' => FALSE,
            'message' => 'Invalid ID'
        ];;
    }

    public function comment($id, $comment, $username){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where("id",$newId)->get("post")->row();
        if($data){
            $this->db->where("id",$newId)->update("post",array("comment_count"=>$data->comment_count+1));
            $message = [
                "idpost"=>$newId,
                "username"=>$username,
                "comment"=>$comment,
            ];
            $this->db->insert("comment",$message);
            return [
                'status' => TRUE,
                'message' => 'Comment success'
        ]   ;
        }
        return [
            'status' => FALSE,
            'message' => 'Invalid ID'
        ];
    }
    //$id -> id comment 
    public function reply($id, $comment, $username){
        $salt = 'qJB0rGtIn5UB1xG03efyCp';
        $newId = $this->Safe->decrypt($id, $salt);
        $data = $this->db->where("id",$id)->get("comment")->row();
        if($data){
            $this->db->set("comment_count",'comment_count+1', false);
            $this->db->where("id",$data->idpost)->update("post");
            $message = [
                "idcomment"=>$id,
                "username"=>$username,
                "comment"=>$comment,
            ];
            $this->db->insert("comment",$message);
            return [
                'status' => TRUE,
                'message' => 'Comment success'
            ];
        }
        return [
            'status' => FALSE,
            'message' => 'Invalid ID'
        ];
    }

    public function upload($data){
        return $this->db->insert("post", $data);
    }

}