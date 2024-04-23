let buttonBox = document.querySelector('.navBarContent')

function menuAbrir() {
    buttonBox.innerHTML = `
    <div class="loginButton" onclick="menuFechar()">
        <br><br><br><br><br><br><br><br><br><br><br>
        <p>Fernanda Caramico</p>
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
        <div class="text5Menu">
            <i class="fa-solid fa-right-from-bracket" style="color: #000000;"></i>
            <p>Sair</p>
        </div>
    </div>`

    document.querySelector('.loginButton').style.width = '240px';
    document.querySelector('.loginButton').style.height = '750px';
    document.querySelector('.loginButton').style.alignItems = 'flex-start';
    document.querySelector('.loginButton').style.paddingLeft = '50px';
}

function menuFechar() {
    buttonBox.innerHTML = `
    <div class="loginButton" onclick="menuAbrir()">
    <p>Fernanda Caramico</p>
    </div>`

    document.querySelector('.loginButton').style.width = '100px';
    document.querySelector('.loginButton').style.height = '50px';
}           

