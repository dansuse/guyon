<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Safe_model extends CI_Model {
    function __construct(){
        parent::__construct();
    }

    function get_hash(){
        return substr(str_shuffle(MD5(microtime())), 0, 10);
    }

    function encrypt( $q , $cryptKey ) {
        /*
        $qEncoded      = base64_encode( mcrypt_encrypt( MCRYPT_RIJNDAEL_256, md5( $cryptKey ), $q, MCRYPT_MODE_CBC, md5( md5( $cryptKey ) ) ) );
        $qEncoded = str_replace('+', '-', $qEncoded);
        return str_replace('/', '-', $qEncoded);*/
        return $q;
    }

    function decrypt( $q , $cryptKey ) {
        /*
        $q = str_replace('-', '+', $q);
        $qDecoded      = rtrim( mcrypt_decrypt( MCRYPT_RIJNDAEL_256, md5( $cryptKey ), base64_decode( $q ), MCRYPT_MODE_CBC, md5( md5( $cryptKey ) ) ), "\0");
        return( $qDecoded );*/
        return $q;
    }
}
