function contar(){
    var d = new Date();
    let horas = d.getHours(); 
    let minutos = d.getMinutes(); 
    let segundos = d.getSeconds();
 
   
    if(segundos >=0 && segundos <10) { 
        segundos = "0"+segundos 
    }
    if(minutos >=0 && minutos <10) {
        minutos = "0"+minutos
    }
    if(horas >=0 && horas <10) {
        horas = "0"+horas
    }
  
    let horario =""
 
     if(horas >=0 && horas <12){
       horario = "Am"
     }else{
       horario = "Pm"
     }
 
     var saida = document.getElementById('hora')
     saida.innerHTML = `${horas}:${minutos}:${segundos}<span id="am-pm">${horario}</span>`

     setInterval(function() {
      contar();
    }, 1000);
 
  }

  contar();
    