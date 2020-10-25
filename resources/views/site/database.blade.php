<?php

error_reporting(0);

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
          die();
          
        }
          mysqli_free_result($result);
      }
      mysqli_close($link);
    }
  }

include "config/db.php";



$id = $_GET['id'];
$nome = $_GET['nome'];
$categoria = $_GET['categoria'];
$imagem = $_GET['imagem'];
$autor = $_GET['autor'];
$tipo = $_GET['tipo'];
$status = $_GET['status'];


if($_GET['action'] == 'addition' && $nome && $autor && $status){
    
    $query = "INSERT INTO `livros`(`nome`, `categoria`, `imagem`, `autor`, `tipo`, `status`) VALUES ('".$nome."','".$categoria."','".$imagem."','".$autor."','".$tipo."','".$status."')";

    if($result = mysqli_query($link, $query)) {
        echo "success";
        die();
    }
    mysqli_close($link);
}

if($_GET['action'] == 'list' && $_GET['id']){
    
    $query = "SELECT `id`, `nome`, `categoria`, `imagem`, `autor`, `tipo`, `status` FROM `livros` WHERE id = '".$_GET['id']."'";

    if ($result = mysqli_query($link, $query)) {

        while($row = mysqli_fetch_row($result)) {

            if($row[5] == "Capa comum"){
                $tipo_html = @"
                <select name='tipo-edit' id='tipo-edit' value='$row[5]'>
                <option value='Capa comum' selected>Capa comum</option>
                <option value='Capa dura'>Capa dura</option>
                <option value='Edição econômica'>Edição econômica</option>
                </select>
                ";

            }elseif($row[5] == "Capa dura"){
                $tipo_html = @"
                <select name='tipo-edit' id='tipo-edit' value='$row[5]'>
                <option value='Capa comum'>Capa comum</option>
                <option value='Capa dura' selected>Capa dura</option>
                <option value='Edição econômica'>Edição econômica</option>
                </select>
                ";

            }elseif($row[5] == "Edição econômica"){
                $tipo_html = @"
                <select name='tipo-edit' id='tipo-edit' value='$row[5]'>
                <option value='Capa comum'>Capa comum</option>
                <option value='Capa dura' selected>Capa dura</option>
                <option value='Edição econômica'>Edição econômica</option>
                </select>
                ";

            }else{
                $tipo_html = @"
                <select name='tipo-edit' id='tipo-edit' value='$row[5]'>
                <option value=''></option>
                <option value='Capa comum'>Capa comum</option>
                <option value='Capa dura'>Capa dura</option>
                <option value='Edição econômica'>Edição econômica</option>
                </select>
                ";
            }

            if($row[6] == 1){
                $status_html = @"
                <select name='status-edit' id='status-edit'>
                <option value='1' selected>Sim</option>
                <option value='0'>Não</option>
                </select><a style='color:red;'>*</a>
                ";

            }else{
                $status_html = @"
                <select name='status-edit' id='status-edit'>
                <option value='1'>Sim</option>
                <option value='0' selected>Não</option>
                </select><a style='color:red;'>*</a>
                ";
            }

            
            echo @"
            <fieldset>
    <center>
    <h1>Editor<img src='./photos/edit-white.png' width='60' height='60'></h1>
    <p style='color:white;'>Campos obrigatórios <a style='color:red;'>*</a></p>
    <legend>Nome:
    <input type='text' id='nome-edit' name='nome-edit' value='$row[1]'/><a style='color:red;'>*</a></legend>
    <legend>Categoria:
    <input type='text' style='width:60%;' id='categoria-edit' name='categoria-edit' value='$row[2]'/></legend>
    <legend>Foto(URL):
    <input type='text' id='imagem-edit' name='imagem-edit' value='$row[3]'/>
    <br><br>
    <img src='$row[3]' width='100' height='120' >
    <br><br>
    </legend>
    <legend>Autor:
    <input type='text' id='autor-edit' name='autor-edit' value='$row[4]'/><a style='color:red;'>*</a></legend>
    <legend>Tipo:
    $tipo_html
    </legend>
    <legend>Adquirido:
    $status_html
    </legend>
    <span name='spanreturn2' id='spanreturn2' style='display: block;'></span>
    <button class='button-add' type='button' onclick='edit($row[0], true);'> <img src='photos/adicionar.png' width='40' height='40' >Salvar</button>
    <button class='button-add' type='button' onclick='voltar();'> <img src='photos/x.png' width='40' height='40' >Fechar</button>
      
    </center>
    </fieldset>
        ";
        }
    }

}

if($_GET['action'] == 'list' && !$_GET['id']){
    
    $query = "SELECT `id`, `nome`, `categoria`, `imagem`, `autor`, `tipo`, `status` FROM `livros` ORDER BY id desc";

    if ($result = mysqli_query($link, $query)) {

      while($row = mysqli_fetch_row($result)) {

        if($row[6] == 1){ $row[6] = "Sim";}else{$row[6] = "Não";}
        
        $livros .= "\n
        <tr><td>$row[0]</td>
        <td>$row[1]</td>
        <td>$row[2]</td>
        <td><img src='$row[3]' width='80' height='100'></td>
        <td>$row[4]</td>
        <td>$row[5]</td>
        <td>$row[6]</td>
        <td>
        <a href='javascript:edit($row[0])'><img src='./photos/edit.png' width='40' height='40'><a>
        <br><br>
        <a href='javascript:Poupdel($row[0])'><img src='./photos/lixeira.png' width='30' height='30'><a>
        </td>
        </tr>";

      }
       mysqli_free_result($result);
   }
    mysqli_close($link);
    echo $livros;
    die();
  }


  if($_GET['action'] == 'edit'){
    
    $query = "UPDATE `livros` SET `nome`='".$nome."',`categoria`='".$categoria."',`imagem`='".$imagem."',`autor`='".$autor."',`tipo`='".$tipo."',`status`='".$status."' WHERE id = '".$id."'";

    if ($result = mysqli_query($link, $query)) {
        Echo "sucess";
        die();
    }
  }

  if($_GET['action'] == 'del' && $_GET['id']){
        $query = "DELETE FROM `livros` WHERE id = ".$_GET['id'].";";
        if ($result = mysqli_query($link, $query)) {
            Echo "sucess";
            die();
        }
  }


?>