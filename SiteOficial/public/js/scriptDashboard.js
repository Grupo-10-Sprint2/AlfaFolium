let buttonBox = document.querySelector('.navBarContent')

function sairDashboard() {

    if (sessionStorage.ID_TIPO_USUARIO == 2) {
        window.location.href = './telaDono.html';
    }

    if (sessionStorage.ID_TIPO_USUARIO == 3) {
        window.location.href = './telaFuncionario.html';
    }
}

function menuAbrir() {
    buttonBox.innerHTML = `
    <div class="menuHamburguer">
    <br><br><br><br><br><br><br><br><br><br><br>
        <div class="loginButton">
        <br>
            <div class="usuarioIcon">
                <i class="fa-solid fa-user fa-xl" style="color: #000000;"></i>
            </div>
            <p class="textoPerfil" onclick="menuFechar()">Olá, Fernanda Caramico</p>
            <br><br><br>
            <div class="text1Menu">
                <i class="fa-solid fa-house" style="color:#000000;"></i>
                <p>Home</p>
            </div>
            <br>
            <div class="text2Menu">
                <i class="fa-solid fa-pencil" style="color: #000000;"></i>
                <p>Editar informações</p>
            </div>
            <br>
            <div class="text3Menu">
                <i class="fa-solid fa-chart-simple" style="color: #000000;"></i>
                <p>Dashboards</p>
            </div>
            
            <br>
            <div class="text4Menu">
                <i class="fa-solid fa-comment-dots" style="color: #000000;"></i> 
                <p>Contato</p>
            </div>
            <br>
            <div class="text5Menu" onclick="acessarHome()">
                <i class="fa-solid fa-right-from-bracket" style="color: #000000;"></i>
                <p>Sair</p>
            </div>
    </div>`

    document.querySelector('.loginButton').style.width = '240px';
    document.querySelector('.loginButton').style.height = '500px';
    document.querySelector('.loginButton').style.alignItems = 'flex-start';
    document.querySelector('.loginButton').style.paddingLeft = '20px';
}

function menuFechar() {
    buttonBox.innerHTML = `
    <div class="loginButton" onclick="menuAbrir()">
    <div class="usuarioIcon">
        <i class="fa-solid fa-user fa-xl" style="color: #000000;"></i>
    </div>
    <p>Fernanda</p>
    <br>
    </div>`

    document.querySelector('.loginButton').style.width = '100px';
    document.querySelector('.loginButton').style.height = '50px';
}           

function acessarHome(){
    window.location.href = './index.html'
}


