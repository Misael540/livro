<?php

error_reporting(0);

if($_COOKIE["hash"]){// Verificar se ja esta logado
  header('Location: ./menu');
  die();//finish code
}


if($_GET['email'] AND $_GET['password'] AND $_GET['login']){//verificar se esta recebendo uma requisição

  $email = $_GET['email'];
  $password = md5($_GET['password']);

  $link = mysqli_connect("127.0.0.1", "root", "", "livros");

  if($link){

    $query = "SELECT level FROM login WHERE email = '".$email."' AND `password` = '".$password."'";

    if ($result = mysqli_query($link, $query)) {
    
       if($row = mysqli_fetch_row($result)) {
        $l = explode("@", $email);
        setcookie("user",  $l[0], time()+3600);
        setcookie("hash", sha1($password), time()+3600); 
        echo "<!--success login!--!>";
        die();//finish code
        
      }
        mysqli_free_result($result);
    }
    mysqli_close($link);
  }
}

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="css/login.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

function sleep(milliseconds) {
  const date = Date.now();
  let currentDate = null;
  do {
    currentDate = Date.now();
  } while (currentDate - date < milliseconds);
}

function validate(){
    var mail = document.getElementById("inputEmail").value;
    var pass = document.getElementById("inputPassword").value;

    if(mail == false || pass == false){
        document.getElementById("loading").style.display = "none";
        $("#spanreturn").text("Preencha os campos obrigatórios!");
        document.getElementById("spanreturn").style.color = "#fd6f6f";
    
    }else{

        if(mail.indexOf("@") != -1 && mail.indexOf(".") != -1 && mail.indexOf(" ") == -1){
            $("#spanreturn").text("");
            document.getElementById("loading").style.display = "";
            checkar(mail,pass);

        }else{
            document.getElementById("loading").style.display = "none";
            $("#spanreturn").text("E-mail inválido!");
            document.getElementById("spanreturn").style.color = "#fd6f6f";
        }
    }
}

function checkar(mail,pass){

  var xhttp;

  if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();

  }else{
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");

  }

  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
      if(this.responseText.indexOf("success login!") && this.responseText.indexOf("script") == -1){
        $("#spanreturn").text("Sucesso, você será redirecionado...");
        document.getElementById("spanreturn").style.color = "#6ffdab";
        sleep(2000);
        $(location).attr('href', '/menu');

      }else{
        document.getElementById("loading").style.display = "none";
        $("#spanreturn").text("Dados inválidos!");
        document.getElementById("spanreturn").style.color = "#fd6f6f";

      }
    }
  };

  xhttp.open("GET", "?login=true&email="+mail+"&password="+pass, true);
  xhttp.send();
}
</script>
</head>
<body class="text-center">
<form id="form" class="form-signin">
<fieldset>
  <img class="mb-4" src="/login.png" alt="" width="82" height="82">
  <h1 class="h4 mb-3 font-weight-normal">Entre em sua conta.</h1>
  <label for="inputEmail" class="sr-only">Email</label>
  <input type="email" name="inputEmail" id="inputEmail" class="form-control" placeholder="Endereço de E-mail" value="" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Senha" value="" required>
  <div class="checkbox mb-3">
    <label class="remember">
      <input class="checkbox-round" type="checkbox" value="remember-me"> Lembrar-me
    </label>
    <br>
    <span name="loading" id="loading" style="display: none;" class="spinner-border text-light"></span>
    <span name="spanreturn" id="spanreturn"></span>
  </div>
  <button style='background-color: #00a9a2;' class="btn btn-lg btn-primary btn-block" type="button" onclick="validate();" >Entrar</button>
  <p class="mt-5 mb-3">&copy; {{date('Y')}}</p>
</fieldset>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>