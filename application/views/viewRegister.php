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
        <title>Register</title>
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
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url('index.php/home/documentation')?>">Documentation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url('index.php/home/pricing')?>">Pricing</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="<?php echo base_url('index.php/home/register')?>">Register</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0" action="<?php echo base_url('MyController/handle_login'); ?>" method="post">
                    <input name="username" class="form-control mr-sm-2" type="text" placeholder="Username">
                    <input name="password" class="form-control mr-sm-2" type="password" placeholder="Password">
                    <input name="submit" type="submit" class="btn btn-outline-primary my-2 my-sm-0" value="Login"></input>
                </form>
            </div>
        </nav>
        <div class="jumbotron jumbotron-fluid" style="background-color:gray;color:white;">
            <h1 class="display-3">Register</h1>
        </div>
        <div class="container-fluid" style="background-color:white;color:black">
            <?php echo form_open('home/handle');?>
            <div class="form-group row">
                <label for="example-email-input" class="col-2 col-form-label">Email</label>
                <div class="col-10">
                    <input name="rEmail" class="form-control" type="email" value="<?php echo set_value('rEmail'); ?>" id="example-email-input">
                    <?php echo form_error('rEmail'); ?>
                </div>
            </div>
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">Name</label>
                <div class="col-10">
                    <input name="rNama" class="form-control" type="text" value="<?php echo set_value('rNama'); ?>" id="example-text-input">
                    <?php echo form_error('rNama'); ?>
                </div>
            </div>
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">Username</label>
                <div class="col-10">
                    <input name="rUsername" class="form-control" type="text" value="<?php echo set_value('rUsername'); ?>" id="example-text-input">
                    <?php echo form_error('rUsername'); ?>
                </div>
            </div>
            <div class="form-group row">
                <label for="example-password-input" class="col-2 col-form-label">Password</label>
                <div class="col-10">
                    <input name="rPassword" class="form-control" type="password" value="<?php echo set_value('rPassword'); ?>" id="example-password-input">
                    <?php echo form_error('rPassword'); ?>
                </div>
            </div>
            <div class="form-group row">
                <label for="example-password-input" class="col-2 col-form-label">Confirm Password</label>
                <div class="col-10">
                    <input name="rConfirm" class="form-control" type="password" value="<?php echo set_value('rConfirm'); ?>" id="example-password-input">
                    <?php echo form_error('rConfirm'); ?>
                </div>
            </div>
            <input name="rRegister" type="submit" class="btn btn-outline-primary my-2 my-sm-0" value="Register"></input>
            <?php echo form_close();?>
            <br>
            <br>
            <br>
        </div>
        <nav class="navbar fixed-bottom navbar-light" style="background-color:#000000; color:white;">
            <p>Copyrights © 2017 Guyon Inc, All Rights Reserved</p>
        </nav>
    </body>
</html>