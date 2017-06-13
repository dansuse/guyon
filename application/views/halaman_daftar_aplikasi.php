<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Daftar Aplikasi</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <style>
        table {border-collapse:collapse; table-layout:fixed; width:100%;}
        table td {border:solid 1px #000000; width:100px; word-wrap:break-word; text-align: center;}
        table th {border:solid 1px #000000; width:100px; word-wrap:break-word; text-align: center;}
    </style>
</head>
<body>

<div>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Guyon</a>
            </div>
            <ul class="nav navbar-nav">
                <!-- <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Page 1</a></li>
                <li><a href="#">Page 2</a></li> -->
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <!-- <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
                <li><a href="<?php echo site_url('/MyController/logout'); ?>"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            </ul>
        </div>
    </nav>
</div>

<div class="container">
    <div class="col-md-3">
        <h4 style="text-align: center;">Daftarkan Aplikasimu</h4>
        <form class="register-form" action="<?php echo site_url('/MyController/handle_daftaraplikasi'); ?>" method="post" style="display: block">
            <div class="form-group">
                <input class="form-control" name="nama_aplikasi" type="text" placeholder="Nama Aplikasi" maxlength="20" required="" />
            </div>
            
            <div class="form-group">
                <input class="form-control" name="redirect_url" type="text" placeholder="Redirect URL" required="" />
            </div>

            <div class="form-group">
                <textarea class="form-control" name="deskripsi_aplikasi" placeholder="Deskripsi Aplikasi" required=""></textarea>
            </div>

            <div class="radio">
                <label><input type="radio" name="limits" value="1000">Paket Rp.100.000,00 untuk 1000 kali akses</label>
            </div>
            <div class="radio">
                <label><input type="radio" name="limits" value="3000">Paket Rp.200.000,00 untuk 3000 kali akses</label>
            </div>

            <input name="submit" class="btn btn-primary form-control" type="submit" value="Buat"></input>
        </form>
        <p>
            <?php 
                if(isset($client_id)){
                    echo $client_id;
                }
            ?>
        </p>
        <p>
            <?php 
                if(isset($client_secret)){
                    echo $client_secret;
                }
            ?>
        </p>
    </div>
    <div class="col-md-9">
        <?php
            
            $this->table->set_heading('Nama Aplikasi', 'Deskripsi Aplikasi', 'Client ID', 'Client Secret', 'Redirect URL', 'API KEY', 'Limits');

            for ($i = 0 ; $i < count($data) ; $i++) {
                $this->table->add_row($data[$i]->nama_aplikasi, '<p class="cell">'.$data[$i]->deskripsi_aplikasi. "</p>", '<p class="cell">'.$data[$i]->client_id."</p>", '<p class="cell">'.$data[$i]->client_secret."</p>", $data[$i]->redirect_uri, $data[$i]->key, $data[$i]->limits);
            }
            echo $this->table->generate();
        ?>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script>
    
</script>

</body>
</html>
