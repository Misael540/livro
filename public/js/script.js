
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
  
    xhttp.open("GET", "data?login=true&email="+mail+"&password="+pass, true);
    xhttp.send();
  }