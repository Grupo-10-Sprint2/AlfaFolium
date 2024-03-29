function calculo(){
    var nome = input_nome.value;
    var qtd_alface = Number(input_qtd_alface.value);
    var custo_producao = Number(input_custo_producao.value);

    var qtd_perdida = qtd_alface * 0.6;
    var qtd_ganha = qtd_alface - qtd_perdida;

    var custo_individual = custo_producao/qtd_alface;
    custo_individual = custo_individual.toFixed(2);


    var prejuizo = qtd_perdida * custo_individual;
    prejuizo = prejuizo.toFixed(2);

    var valor_investimento = custo_producao - prejuizo;
    valor_investimento = valor_investimento.toFixed(2);

    var ganho_total = qtd_alface * 2;
    ganho_total = ganho_total.toFixed(2)

    var lucro_plantacao_total = (qtd_alface * 2) - custo_producao;
    lucro_plantacao_total = lucro_plantacao_total.toFixed(2);

    var ganho_sem_controle = qtd_ganha*2;
    ganho_sem_controle = ganho_sem_controle.toFixed(2);

    var lucro_plantacao_atual = (qtd_ganha * 2) - custo_producao;
    lucro_plantacao_atual = lucro_plantacao_atual.toFixed(2);


    div_resultado.innerHTML = `Caro ${nome}, você investe R$${custo_individual} em cada alface de sua plantação,
                                sendo assim, levando em conta que 60% das plantações são perdidas pela falta
                                de controle de temperatura e umidade, você pode estar perdendo na produção cerca de
                                ${qtd_perdida} unidades, e no financeiro R$${prejuizo}! sobrando apenas ${qtd_ganha} unidades
                                e R$${valor_investimento} do investimento.<br>
                                Se houvesse o controle dos elementos citados, vendendo cada alface por apenas R$2,00 você ganharia R$${ganho_total}
                                e lucraria R$${lucro_plantacao_total}, mas sem o controle o ganho é R$${ganho_sem_controle} e o lucro R$${lucro_plantacao_atual}.<br>
                                Para mais informações, entre em contato com a equipe do AlfaFolium!`


    conteudo.style.justifyContent = 'space-evenly'
    container_resultado.style.display = 'initial';
}