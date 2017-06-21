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
        <title>Home</title>
        <link rel="icon" href="<?php echo base_url('assets/Image/guyon.png')?>">
    </head>
    <body>
        <nav class="navbar fixed-top navbar-toggleable-md navbar-light bg-faded" style="background-color:white;">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"> <img src="<?php echo base_url('assets/Image/guyon.png')?>" width="100" height="50" class="d-inline-block align-top" alt=""></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<?php echo base_url('index.php/home/index')?>">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
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
            <h2 class="display-3" style="margin-top: 5%; margin-left: 5%;">
            Guyon API</h1>
            <p class="lead" style="margin-bottom: 5%; margin-left: 5%;">Layanan Tertawa Untuk Aplikasi Anda !</p>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox" style="background-color:gray;">
                    <div class="carousel-item active">
                        <img class="d-block img-fluid" src="<?php echo base_url('assets/Image/car1.jpg')?>" width="100%"  alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="<?php echo base_url('assets/Image/car2.jpg')?>" width="100%" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="<?php echo base_url('assets/Image/car3.png')?>" width="100%"  alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="container" style="background-color:white;color:black">
            <div class="jumbotron" style="background-color:black;color:white;">
                <h1 class="display-3">Welcome</h1>
                <p class="lead">Read the documentation for a better information!</p>
                <hr class="my-4">
                <p class="lead">
                    <a class="btn btn-primary btn-lg" href="<?php echo base_url('index.php/home/documentation')?>" role="button">Learn more</a>
                </p>
            </div>
        </div>
        <br>
        <br>
        <nav class="navbar fixed-bottom navbar-light" style="background-color:#000000;color:white;">
            <p>Copyrights © 2017 Guyon Inc, All Rights Reserved</p>
        </nav>
    </body>
</html>