document.addEventListener("DOMContentLoaded", function transicaoLogin() {
    let boxCadastro = document.querySelector('.boxCadastro')
    let botaoVoltar = document.querySelector('.botaovoltar')

    boxCadastro.style.transform = 'translateY(1%)'
    boxCadastro.style.transition = '1.2s'
    botaoVoltar.style.transform = 'translateX(10%)'
});