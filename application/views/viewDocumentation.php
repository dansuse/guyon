<?php
   defined('BASEPATH') OR exit('No direct script access allowed');
   ?><!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
      <title>Documentation</title>
      <link rel="icon" href="<?php echo base_url('assets/Image/guyon.png')?>">
   </head>
   <body>
      <nav class="navbar fixed-top navbar-toggleable-md navbar-light bg-faded" style="background-color:white;">
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>
         <a class="navbar-brand" href="<?php echo base_url('index.php/home/index')?>"> <img src="<?php echo base_url('assets/Image/guyon.png')?>" width="100" height="50" class="d-inline-block align-top" alt=""></a>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
               <li class="nav-item">
                  <a class="nav-link" href="<?php echo base_url('index.php/home/index')?>">Home <span class="sr-only">(current)</span></a>
               </li>
               <li class="nav-item active">
                  <a class="nav-link" href="<?php echo base_url('index.php/home/documentation')?>">Documentation</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="<?php echo base_url('index.php/home/pricing')?>">Pricing</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="<?php echo base_url('index.php/home/register')?>">Register</a>
               </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="http://localhost/guyon/MyController/handle_login" method="post">
               <input name="username" class="form-control mr-sm-2" type="text" placeholder="Username">
               <input name="password" class="form-control mr-sm-2" type="password" placeholder="Password">
               <input name="submit" type="submit" class="btn btn-outline-primary my-2 my-sm-0" value="Login"></input>
            </form>
         </div>
      </nav>
      <div class="jumbotron jumbotron-fluid" style="background-color:gray;color:white;">
         <h1 class="display-3" style="margin-top: 5%; margin-left: 5%;">Documentation</h1>
      </div>
      <div class="container" style="background-color:white;color:black">
        <h3>API Services</h3>
        <br><br><h6>Post Related Services</h6>
        <table class="table">
            <tr>
               <th>Method</th>
               <th>Endpoint</th>
               <th>Usage</th>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_all_get'); ?>">/api/post/all</a></td>
               <td>Untuk mendapatkan semua postingan</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_trending_get'); ?>">/api/post/trending</a></td>
               <td>Untuk mendapatkan postingan trending (urut upvote terbanyak)</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_hot_get'); ?>">/api/post/hot</a></td>
               <td>Untuk mendapatkan postingan hot (urut komen terbanyak)</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_fresh_get'); ?>">/api/post/fresh</a></td>
               <td>Untuk mendapatkan postingan fresh (urut dari terbaru)</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_explore_get'); ?>">/api/post/explore</a></td>
               <td>Untuk mendapatkan postingan explore (urut dari terbaru)</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_kategori_get'); ?>">/api/post/kategori</a></td>
               <td>Untuk mendapatkan postingan berdasarkan suatu kategori</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_get_get'); ?>">/api/post/get</a></td>
               <td>Untuk mendapatkan suatu postingan berdasarkan ID</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_most_get'); ?>">/api/post/most</a></td>
               <td>Untuk mendapatkan postingan dengan like terbayak</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_user_get'); ?>">/api/post/user</a></td>
               <td>Untuk mendapatkan semua postingan dari suatu user</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_random_get'); ?>">/api/post/random</a></td>
               <td>Untuk mendapatkan suatu postingan yang acak</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_comment_get'); ?>">/api/post/comment</a></td>
               <td>Untuk mendapatkan komentar pada suatu post</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_memegen_templates_get'); ?>">/api/post/memegen_templates</a></td>
               <td>Untuk mendapatkan daftar template dari API memegen</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_memegen_fonts_get'); ?>">/api/post/memegen_fonts</a></td>
               <td>Untuk mendapatkan daftar font dari API memegen</td>
            </tr>
            <tr>
               <td>GET</td>
               <td><a href="<?php echo site_url('Home/documentation#post_memegen_create_meme_get'); ?>">/api/post/memegen_create_meme</a></td>
               <td>Untuk mendapatkan link gambar meme sesuai parameter yang diminta</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_edit_caption_post'); ?>">/api/post/edit_caption</a></td>
               <td>Untuk mengedit caption suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_report_post'); ?>">/api/post/report</a></td>
               <td>Untuk melaporkan suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_upvote_reply_post'); ?>">/api/post/upvote_reply</a></td>
               <td>Untuk memberikan voting plus pada balasan komentar untuk suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_downvote_reply_post'); ?>">/api/post/downvote_reply</a></td>
               <td>Untuk memberikan voting minus pada balasan komentar untuk suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_upvote_comment_post'); ?>">/api/post/upvote_comment</a></td>
               <td>Untuk memberikan voting plus pada komentar untuk suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_downvote_comment_post'); ?>">/api/post/downvote_comment</a></td>
               <td>Untuk memberikan voting minus pada komentar untuk suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_upvote_post'); ?>">/api/post/upvote</a></td>
               <td>Untuk memberikan voting plus untuk suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_downvote_post'); ?>">/api/post/downvote</a></td>
               <td>Untuk memberikan voting minus untuk suatu post</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_comment_post'); ?>">/api/post/comment</a></td>
               <td>Untuk memberikan suatu komentar pada suatu postingan</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_reply_post'); ?>">/api/post/reply</a></td>
               <td>Untuk memberikan suatu balasan komentar pada suatu postingan</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_upload_post'); ?>">/api/post/upload</a></td>
               <td>Untuk mengupload suatu postingan</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#post_delete_post'); ?>">/api/post/delete</a></td>
               <td>Untuk menghapus suatu postingan</td>
            </tr>
         </table>
         <br><br><h6>User Related Services</h6>
         <table class="table">
            <tr>
               <th>Method</th>
               <th>Endpoint</th>
               <th>Usage</th>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#user_register_post'); ?>">/api/user/register</a></td>
               <td>Untuk register user baru</td>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#user_login_post'); ?>">/api/user/login</a></td>
               <td>Untuk login user</td>
            </tr>
            <tr>
               <td>DELETE</td>
               <td><a href="<?php echo site_url('Home/documentation#user_users_delete'); ?>">/api/user/users</a></td>
               <td>Untuk menghapus user</td>
            </tr>
         </table>
         <br><br><h6>Key Related Services</h6>
         <table class="table">
            <tr>
               <th>Method</th>
               <th>Endpoint</th>
               <th>Usage</th>
            </tr>
            <tr>
               <td>POST</td>
               <td><a href="<?php echo site_url('Home/documentation#key_new_post'); ?>">/api/key/new</a></td>
               <td>Untuk men-generate API KEY baru</td>
            </tr>
         </table>
         <br><br><h3>Authentication</h3>
         <h4>OAuth 2.0</h4>
         <br><h5>Request Authorization Code</h5>
         <br><br><h6>Request</h6>
         <table class="table">
            <tr>
               <th>Setting</th>
               <th>Value</th>
            </tr>
            <tr>
               <td>HTTP Method</td>
               <td>POST</td>
            </tr>
            <tr>
               <td>Path</td>
               <td>/api/oauth2/authorize?response_type=code&client_id={client_id}&state=xyz&redirect_uri={redirect_uri}</td>
            </tr>
            <tr>
               <td>Host</td>
               <td>localhost/guyon</td>
            </tr>
         </table>
         <br><br><h6>Request Headers</h6>
         <table class="table">
            <tr>
               <th>Name</th>
               <th>Format</th>
               <th>Mandatory</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>Content-Type</td>
               <td>application/x-www-form-urlencoded</td>
               <td>Yes</td>
            </tr>
            <tr>
               <td>Authorization</td>
               <td>Basic Auth (username:password)</td>
               <td>Yes</td>
            </tr>
         </table>
         <br><br><h6>Payload</h6>
         <table class="table">
            <tr>
               <th>Field</th>
               <th>Data Type</th>
               <th>Mandatory</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>authorized</td>
               <td>String</td>
               <td>Yes</td>
               <td>value = yes/no</td>
            </tr>
         </table>
         <br><br><h6>Response</h6>
         <table class="table">
            <tr>
               <th>Field</th>
               <th>Data Type</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>code</td>
               <td>String</td>
               <td>authorization code valid for 30 seconds</td>
            </tr>
            <tr>
               <td>status</td>
               <td>Boolean</td>
               <td>value = true/false</td>
            </tr>
         </table>

         <br><h5>Request Access Token</h5>
         <br><br><h6>Request</h6>
         <table class="table">
            <tr>
               <th>Setting</th>
               <th>Value</th>
            </tr>
            <tr>
               <td>HTTP Method</td>
               <td>POST</td>
            </tr>
            <tr>
               <td>Path</td>
               <td>/api/oauth2/token</td>
            </tr>
            <tr>
               <td>Host</td>
               <td>localhost/guyon</td>
            </tr>
         </table>
         <br><br><h6>Request Headers</h6>
         <table class="table">
            <tr>
               <th>Name</th>
               <th>Format</th>
               <th>Mandatory</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>Content-Type</td>
               <td>application/x-www-form-urlencoded</td>
               <td>Yes</td>
            </tr>
            <tr>
               <td>Authorization</td>
               <td>Basic Auth (client_id:client_secret)</td>
               <td>Yes</td>
            </tr>
         </table>
         <br><br><h6>Payload</h6>
         <table class="table">
            <tr>
               <th>Field</th>
               <th>Data Type</th>
               <th>Mandatory</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>grant_type</td>
               <td>String</td>
               <td>Yes</td>
               <td>value = client_credentials</td>
            </tr>
            <tr>
               <td>code</td>
               <td>String</td>
               <td>Yes</td>
               <td>value = {authorization code}</td>
            </tr>
         </table>
         <br><br><h6>Response</h6>
         <table class="table">
            <tr>
               <th>Field</th>
               <th>Data Type</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>access_token</td>
               <td>String</td>
               <td>access token for access API</td>
            </tr>
            <tr>
               <td>expires_in</td>
               <td>Integer</td>
               <td>value in seconds</td>
            </tr>
            <tr>
               <td>token_type</td>
               <td>String</td>
               <td>value = "Bearer"</td>
            </tr>
            <tr>
               <td>scope</td>
               <td>String</td>
               <td></td>
            </tr>
            <tr>
               <td>refresh_token</td>
               <td>String</td>
               <td>refresh token which valid for 14 days (only if needed)</td>
            </tr>
         </table>

         <br><h5>Refresh Access Token</h5>
         <br><br><h6>Request</h6>
         <table class="table">
            <tr>
               <th>Setting</th>
               <th>Value</th>
            </tr>
            <tr>
               <td>HTTP Method</td>
               <td>POST</td>
            </tr>
            <tr>
               <td>Path</td>
               <td>/api/oauth2/token</td>
            </tr>
            <tr>
               <td>Host</td>
               <td>localhost/guyon</td>
            </tr>
         </table>
         <br><br><h6>Request Headers</h6>
         <table class="table">
            <tr>
               <th>Name</th>
               <th>Format</th>
               <th>Mandatory</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>Content-Type</td>
               <td>application/x-www-form-urlencoded</td>
               <td>Yes</td>
            </tr>
            <tr>
               <td>Authorization</td>
               <td>Basic Auth (client_id:client_secret)</td>
               <td>Yes</td>
            </tr>
         </table>
         <br><br><h6>Payload</h6>
         <table class="table">
            <tr>
               <th>Field</th>
               <th>Data Type</th>
               <th>Mandatory</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>grant_type</td>
               <td>String</td>
               <td>Yes</td>
               <td>value = refresh_token</td>
            </tr>
            <tr>
               <td>refresh_token</td>
               <td>String</td>
               <td>Yes</td>
               <td>value = {refresh_token}</td>
            </tr>
         </table>
         <br><br><h6>Response</h6>
         <table class="table">
            <tr>
               <th>Field</th>
               <th>Data Type</th>
               <th>Description</th>
            </tr>
            <tr>
               <td>access_token</td>
               <td>String</td>
               <td>access token for access API</td>
            </tr>
            <tr>
               <td>expires_in</td>
               <td>Integer</td>
               <td>value in seconds</td>
            </tr>
            <tr>
               <td>token_type</td>
               <td>String</td>
               <td>value = "Bearer"</td>
            </tr>
            <tr>
               <td>scope</td>
               <td>String</td>
               <td></td>
            </tr>
         </table>
        <h3>API Services Detail</h3>
        <div id="post_all_get" class="col-md-12">
            <br><h4>/api/post/all</h4>
            <br><h5>Request</h5>
            <table class="table">
                <tr>
                   <th>Field</th>
                   <th>Data Type</th>
                   <th>Mandatory</th>
                   <th>Description</th>
                </tr>
                <tr>
                   <td>user</td>
                   <td>String</td>
                   <td>N</td>
                   <td>untuk mencari tahu apakah user bersangkutan telah memberi like pada post yang dikembalikan atau belum</td>
                </tr>
                <tr>
                   <td>start</td>
                   <td>Integer</td>
                   <td>Y</td>
                   <td>mulai dari post berapa</td>
                </tr>
                <tr>
                   <td>end</td>
                   <td>Integer</td>
                   <td>Y</td>
                   <td>berakhir di post berapa</td>
                </tr>
             </table>
        </div>
        <div id="post_trending_get" class="col-md-12">
        </div>
        <div id="post_hot_get" class="col-md-12">
        </div>
        <div id="post_fresh_get" class="col-md-12">
        </div>
        <div id="post_explore_get" class="col-md-12">
        </div>
      </div>
      <nav class="navbar navbar-light" style="background-color:#000000;color:white;">
         <p>Copyrights © 2017 Guyon Inc, All Rights Reserved</p>
      </nav>
   </body>
</html>