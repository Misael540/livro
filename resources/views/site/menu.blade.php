<?php

error_reporting(0);
if($_COOKIE["hash"] && $_COOKIE['user']){

    $link = mysqli_connect("127.0.0.1", "root", "", "livros");

  

}else{
    header('Location: ./login');
    die();
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/menu.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  
<script>

function listing(data){

  var xhttp;

  if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
  }else{
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");

  }
  xhttp.onreadystatechange = function() {
   if (this.readyState == 4 && this.status == 200) {
     
     if(this.responseText){
      $("#tbody1").html(this.responseText);
     }
    }
  };

  if(data){
    xhttp.open("GET", "data?action=list&search=" + data, true);

  }else{
    xhttp.open("GET", "data?action=list", true);

  }

  xhttp.send();
}

function get(data){
  
  if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
  }else{
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");

  }

  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      if(this.responseText == 'success'){
        document.getElementById("spanreturn1").style.color = "#60d25c";
        $("#spanreturn1").text("Livro cadastrado com sucesso!");
        document.getElementById("nome").value = ""; 
        document.getElementById("categoria").value = ""; 
        document.getElementById("imagem").value = ""; 
        document.getElementById("autor").value = ""; 
        document.getElementById("tipo").value = ""; 
        document.getElementById("status").value = "";
      
      }else{
        document.getElementById("spanreturn1").style.color = "#fd6f6f";
        $("#spanreturn1").text("Erro, verifique os dados e tente novamente!");

      }

    }
  };

  xhttp.open("GET", "data?" + data, true);
  xhttp.send();

}

function add(int){

  $("#spanreturn1").text("");

  document.getElementById("edit").className = 'divFlutuanteHidden';
  document.getElementById("del").className = 'divFlutuanteHidden';

  if(int == 1){
    var nome = document.getElementById("nome").value; 
    var categoria = document.getElementById("categoria").value; 
    var imagem = document.getElementById("imagem").value; 
    var autor = document.getElementById("autor").value; 
    var tipo = document.getElementById("tipo").value; 
    var status = document.getElementById("status").value;

    if(nome && autor && status){

      get("action=addition&nome="+nome+"&categoria="+categoria+"&imagem="+imagem+"&autor="+autor+"&tipo="+tipo+"&status="+status);   
      listing();

    }else{
      $("#spanreturn1").text("Preencha os campos obrigatórios (*) !");
      document.getElementById("spanreturn1").style.color = "#fd6f6f";
    }

  }else{
  document.getElementById("add").className = 'divFlutuante';
  
  }
}

function edit(id, save){
  
  document.getElementById("add").className = 'divFlutuanteHidden';
  document.getElementById("del").className = 'divFlutuanteHidden';
  document.getElementById("edit").className = 'divFlutuante';
  $("#spanreturn2").text("");

  var xhttp;

  if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
  }else{
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  if(save){

    var nome = document.getElementById("nome-edit").value; 
    var categoria = document.getElementById("categoria-edit").value; 
    var imagem = document.getElementById("imagem-edit").value; 
    var autor = document.getElementById("autor-edit").value; 
    var tipo = document.getElementById("tipo-edit").value; 
    var status = document.getElementById("status-edit").value;

    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        if(this.responseText == "sucess"){
          document.getElementById("spanreturn2").style.color = "#60d25c";
          $("#spanreturn2").text("Salvo com sucesso!");

        }else{
          document.getElementById("spanreturn2").style.color = "#fd6f6f";
          $("#spanreturn2").text("Erro ao salvar.");
        }
      }
    };

    xhttp.open("GET", "data?action=edit&id="+id+"&nome="+nome+"&categoria="+categoria+"&imagem="+imagem+"&autor="+autor+"&tipo="+tipo+"&status="+status, true);
    xhttp.send();
    
  }else{
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        if(this.responseText){
          $("#edit").html(this.responseText);
        }
      }
  };

    xhttp.open("GET", "data?action=list&id=" + id, true);
    xhttp.send();

  }

  listing();

}

function Poupdel(id){

  document.getElementById("add").className = 'divFlutuanteHidden';
  document.getElementById("edit").className = 'divFlutuanteHidden';
  document.getElementById("del").className = 'divFlutuante';
  document.getElementById("id").value = id;

}

function del(){

  if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
  }else{
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  
  id = document.getElementById("id").value;

  xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        if(this.responseText == "sucess"){
          voltar();
          listing();
        }else{

        }
      }
    };

    xhttp.open("GET", "data?action=del&id=" + id, true);
    xhttp.send();

}


function voltar(){
  document.getElementById("add").className = 'divFlutuanteHidden';
  document.getElementById("edit").className = 'divFlutuanteHidden';
  document.getElementById("del").className = 'divFlutuanteHidden';

}

</script>
</head>
<body>

<div class="jumbotron" style="margin-bottom:0">
  <h1 style="color:white;">&nbsp;&nbsp;Gerenciamento de livros</h1>
  <p></p> 
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <span class="navbar-brand">Olá, {{$_COOKIE['user']}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
  </div>
</nav>
<!-- DIV EDIT LIVRO-->
<div class="divFlutuanteHidden" id="del" name="del" style="top: 60%">
<fieldset>
  <center>
    <span style="display: block; color:white;">Tem certeza que quer excluir?</span>
    <input type="hidden" name="id" id="id" value="">
    <button class="button-add" type="button" onclick="del()"> <img src="photos/adicionar.png" width='40' height='40' >Sim</button>
    <button class="button-add" type="button" onclick="voltar();"> <img src="photos/x.png" width='40' height='40' >Não</button>
  </center>
</fieldset>
</div>

<!-- DIV EDIT LIVRO-->
<div class="divFlutuanteHidden" id="edit" name="edit" style="top: 20%">
  
</div>
<!-- DIV ADD LIVRO-->
<div class="divFlutuanteHidden" id="add" name="add">
    <fieldset>
    <center>
      <h1>Adicionar</h1>
      <p style="color:white;">Campos obrigatórios <a style="color:red;">*</a></p>
      
    <legend>Nome:
    <input type="text" id="nome" name="nome"/><a style="color:red;">*</a></legend>
    <legend>Categoria:
    <input type="text" style="width:60%;" id="categoria" name="categoria"/></legend>
    <legend>Foto (URL):
    <input type="text" id="imagem" name="imagem"/>
    </legend>
    <legend>Autor:
    <input type="text" id="autor" name="autor"/><a style="color:red;">*</a></legend>
    <legend>Tipo:
    <select name="tipo" id="tipo">
      <option value="" selected></option>
      <option value="Capa comum">Capa comum</option>
      <option value="Capa dura">Capa dura</option>
      <option value="Edição econômica">Edição econômica</option>
    </select></legend>
    <legend>Adquirido:
    <select name="status" id="status">
      <option value="1" selected>Sim</option>
      <option value="0">Não</option>
    </select><a style="color:red;">*</a></legend>
    <span name="spanreturn1" id="spanreturn1" style="display: block;"></span>
    <button class="button-add" type="button" onclick="add(1);"> <img src="photos/adicionar.png" width='40' height='40' >Adicionar</button>
    <button class="button-add" type="button" onclick="voltar();"> <img src="photos/x.png" width='40' height='40' >Fechar</button>
      
    </center>
  </fieldset>
</div>
<div class="container">
 <button class="button-add" type="button" onclick="add();"> <img src="photos/adicionar.png" width='40' height='40' >Adicionar livro&nbsp;&nbsp;</button>
 <legend style="color: #222; Font-size: 18px;">Buscar: <input type="text" name="buscar" id="buscar" value onchange="listing(this.value)" placeholder="Palavra chave"></legend>
 <br>
</div>
<br>
<div class="container">
    <table id="dtVerticalScroll" class="table table-striped table-bordered table-sm" cellspacing="0" width="70%">
    <thead>
        <tr>
        <th class="th-sm">ID
        </th>
        <th class="th-sm">Nome
        </th>
        <th class="th-sm">Categoria
        </th>
        <th class="th-sm">Foto
        </th>
        <th class="th-sm">Autor
        </th>
        <th class="th-sm">Tipo
        </th>
        <th class="th-sm">Adquirido
        </th>
      </tr>
      </thead>
      <tbody id='tbody1' name='tbody1'>
      
      </tbody>
      <tfoot>
    <tr>
      <th>ID
      </th>
      <th>Nome
      </th>
      <th>Categoria
      </th>
      <th>Foto
      </th>
      <th>Autor
      </th>
      <th>Tipo
      </th>
      <th>Adquirido
      </th>
    </tr>
  </tfoot>
  </table>
</div>
<div class="jumbotron text-center" style="margin-bottom:0">
<p class="mt-5 mb-3" style="color:white;">&copy; {{date('Y')}}</p>
</div>
</body>
</html>
<script>
  listing();
</script>