<?php

error_reporting(0);
if($_COOKIE["hash"] && $_COOKIE['user']){

$link = mysqli_connect("127.0.0.1", "root", "", "livros");

  

}else{
    header('Location: ./login');
    die();
}



?>