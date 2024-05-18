


// Função para a animação das divs:
function animacaoBox(){
    const calculator1 = document.querySelector('.calculator1');
    const calculator2 = document.querySelector('.calculator2');
    const imgAlface = document.querySelector('.imgAlface');

    imgAlface.style.transform = 'translateY(-110%)';
    calculator1.style.transform = 'translateX(-55%)';
    calculator2.style.transform = 'translateX(55%)';
}











// Função para a elaboração dos cálculos matemáticos envolvidos na lógica do simulador
function exibirCalculos(){


        // Declaração das variáveis:
        let qntdEstufas = Number(input_qntdEstufas.value);
        let qntdAlfacesEstufa = Number(input_qntdAlfaces.value);
        let qntdAlfacesTotal = (qntdEstufas * qntdAlfacesEstufa);
        let taxaPerda = Number(input_percentualPerda.value/100);
        let custoProducao = Number(input_custoProducao.value);
        let custoProducao_formatado = custoProducao.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});
        let alfacesPerdidos = Number(qntdAlfacesTotal*taxaPerda);
        const inflacaoAnual = 1.3;


    if(qntdEstufas == 0 || qntdAlfacesEstufa == 0 || taxaPerda == 0 || custoProducao == 0 || alfacesPerdidos == 0){
        alert('Preencha todos os campos!')
    } else {

        animacaoBox()

        document.querySelector('.resultsBox').innerHTML = ''

        if(qntdEstufas >= 1 && qntdEstufas <= 10){
            const alfaceVendas = (alfacesPerdidos*3.5).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});
            const aumentoDispesas = 1.05;
            const prejuizoTotal = (custoProducao*inflacaoAnual*aumentoDispesas);
            const prejuizoTotal_formatado = prejuizoTotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});
            
            

            document.querySelector('.resultsBox').innerHTML += `<p> A sua empresa, considerada de pequeno porte, com <b>${qntdEstufas} estufa(s)</b>, contendo <b>${qntdAlfacesTotal} alfaces</b> em produção total e com uma estimativa de perda de <b style="color:#FF6961;">${taxaPerda}%</b>, contem um prejuízo aproximado de <b>${Math.trunc(alfacesPerdidos)}</b> unidades de alfaces mensalmente.<p>
            <br>
            <p>Equivalente a <b style="color:#FF6961;">${alfaceVendas}</b> reais que poderiam ter sido arrecadados todo mês.</p> 
            <br>
            <p>Com investimentos de <b>${custoProducao_formatado}</b> reais mensais para a produção, a projeção de perda a longo prazo, contando com a <b>inflação anual</b> e o <b>aumento dessas despesas</b>, pode chegar a <b style="color:#FF6961;">${prejuizoTotal_formatado}</b> reais anualmente.
            `
            
            document.querySelector('.resultsBox').innerHTML += `<div class="buttonBox">
            <button id="button_solucao" class="buttonSolucao" onclick="exibirSolucao()"> SOLUÇÃO DA ALFA </button>
            </div>
            `

        } else if(qntdEstufas <= 50){
            const alfaceVendas = (alfacesPerdidos*3.8).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});
            const aumentoDispesas = 1.10;
            const prejuizoTotal = (custoProducao*inflacaoAnual*aumentoDispesas);
            const prejuizoTotal_formatado = prejuizoTotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});


            document.querySelector('.resultsBox').innerHTML += `<p> A sua empresa, considerada de médio porte, com <b>${qntdEstufas} estufa(s)</b>, contendo <b>${qntdAlfacesTotal} alfaces</b> em produção total e com uma estimativa de perda de <b style="color:#FF6961;">${taxaPerda}%</b>, contem um prejuízo aproximado de <b>${Math.trunc(alfacesPerdidos)}</b> unidades de alfaces mensalmente.<p>
            <br>
            <p>Equivalente a <b style="color:#FF6961;">${alfaceVendas}</b> reais que poderiam ter sido arrecadados todo mês.</p> 
            <br>
            <p>Com investimentos de <b>${custoProducao_formatado}</b> reais mensais para a produção, a projeção de perda a longo prazo, contando com a <b>inflação anual</b> e o <b>aumento dessas despesas</b>, pode chegar a <b style="color:#FF6961;">${prejuizoTotal_formatado}</b> reais anualmente.
            `

            document.querySelector('.resultsBox').innerHTML += `<div class="buttonBox">
            <button id="button_solucao" class="buttonSolucao" onclick="exibirSolucao()"> SOLUÇÃO DA ALFA </button>
            </div>
            `

        } else{
            const alfaceVendas = (alfacesPerdidos*4).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});
            const aumentoDispesas = 1.15;
            const prejuizoTotal = (custoProducao*inflacaoAnual*aumentoDispesas);
            const prejuizoTotal_formatado = prejuizoTotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});


            document.querySelector('.resultsBox').innerHTML += `<p> A sua empresa, considerada de grande porte, com <b>${qntdEstufas} estufa(s)</b>, contendo <b>${qntdAlfacesTotal} alfaces</b> em produção total e com uma estimativa de perda de <b style="color:#FF6961;">${taxaPerda}%</b>, contem um prejuízo aproximado de <b>${Math.trunc(alfacesPerdidos)}</b> unidades de alfaces mensalmente.<p>
            <br>
            <p>Equivalente a <b style="color:#FF6961;">${alfaceVendas}</b> reais que poderiam ter sido arrecadados todo mês.</p> 
            <br>
            <p>Com investimentos de <b>${custoProducao_formatado}</b> reais mensais para a produção, a projeção de perda a longo prazo, contando com a <b>inflação anual</b> e o <b>aumento dessas despesas</b> pode chegar a <b style="color:#FF6961;">${prejuizoTotal_formatado}</b> reais anualmente.
            `

            document.querySelector('.resultsBox').innerHTML += `<div class="buttonBox">
            <button id="button_solucao" class="buttonSolucao" onclick="exibirSolucao()"> SOLUÇÃO DA ALFA </button>
            </div>
            `

        }
    }
}


function exibirSolucao(){

    // Declaração das variáveis:
    let qntdEstufas = Number(input_qntdEstufas.value);
    let qntdAlfacesEstufa = Number(input_qntdAlfaces.value);
    let qntdAlfacesTotal = (qntdEstufas * qntdAlfacesEstufa);

    let custoProducao = Number(input_custoProducao.value);
    let custoProducao_formatado = custoProducao.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});

    let taxaPerda = Number(input_percentualPerda.value/100);
    let alfacesPerdidos = Number(qntdAlfacesTotal*taxaPerda);
    let alfacesRecuperados = alfacesPerdidos*0.5

    let valorArrecadadoAnual = (alfacesRecuperados*4*12);
    let valorArrecadado_formatado = valorArrecadadoAnual.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});

    let rentabilidadeInvestimentos = (custoProducao*alfacesRecuperados)*1.5;
    let rentabilidadeInvestimentos_formatado = rentabilidadeInvestimentos.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL'});

    document.querySelector('.resultsBox').style.fontSize = '30px';
    
    document.querySelector('.resultsBox').innerHTML = ''

    document.querySelector('.resultsBox').innerHTML += `<h3> Alfaces Perdidos: </h3>
    <p style="color:#FF6961;"> - ${Math.trunc(alfacesRecuperados)} unidades</p>
    <p> - Com a solução: <b style="color:#90EE90;">${Math.trunc(alfacesRecuperados)*0.5}</b> unidades (<b style="color:#90EE90;">Redução de 50% em perdas</b>)</p> 
    <br>
    <h3> Estimativas em cima da redução de perdas: </h3>
    <p> - Estimativa de arrecadação anual: <b style="color:#90EE90;">${valorArrecadado_formatado}</b></p>
    <p> - Rentabilidade estimada dos investimentos: <b style="color:#90EE90;">${rentabilidadeInvestimentos_formatado}</b></p>
    ` // Math.trunc usado para remover casas decimais sem arrendondar o valor obtido. 
}