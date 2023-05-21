*Settings*

Documentation    Arquivo com as ações para executar no sistema

*Keywords*
# Ações para o teste de produto
Pesquisar produto
    [Arguments]    ${produto}

    Input Text    xpath=//div[@class="sc-cuWdqJ hNLKyd"]//input[@placeholder="Busque aqui"]
    ...           text=${produto}

    Click Element    xpath=//div[@class="sc-cuWdqJ hNLKyd"]//button[@class="sc-bTRMho bbCnrT"]

Validar retorno Iphone

    Location Should Be    https://www.kabum.com.br/celular-telefone/smartphones/apple

Navegar no menu

    Click Element               xpath=//div[@id="menuExpansivelCategorias"]//button
    Wait Until Page Contains    text=Hardware         timeout=00:00:10
    Click Element               xpath=//div[@id="menuExpansivelCategorias"]//a[@href="https://www.kabum.com.br/hardware"]

Validar mudança de página

    Wait Until Page Contains    text=Você está em:    timeout=00:00:10 

Adicionar cooler carrinho

    Click Element    xpath=//a[@href="https://www.kabum.com.br/hardware/coolers"]
    Click Element    xpath=//a[@href="https://www.kabum.com.br/hardware/coolers/36-cm"]
    Click Element    xpath=//button[@title="Visualizar em Lista"]
    Click Element    xpath=//div[@class="sc-gWHigU sc-citxvW eCsoxG gLSrQW availableFooterCard"]

Validar item no carrinho

    Wait Until Page Contains    text=PRODUTO ADICIONADO NO CARRINHO

# Ações para o teste de usuário

Logar no sistema
    [Arguments]    ${login}    ${senha}

    Click Element    xpath=(//div[@id="blocoInformacoesCliente"]//a[@class="sc-irOPex fNAAOg"])[1]

    Wait Until Page Contains    text=Identificação    timeout=00:00:10    

    Input Text       xpath=(//main [@class ="sc-eFuaqX hymkGN"]//input)[1]
    ...              text= ${login}
    Input Text       xpath=(//main [@class ="sc-eFuaqX hymkGN"]//input)[2]
    ...              text= ${senha}
    Click Element    xpath=//div[@class ="sc-cOajNj ywwMG"]//button[@id="botaoLogin"]

Invalido
    Wait Until Page Contains    text=Dados inválidos, tente novamente!    timeout=00:00:20

Consentimento
    Wait Until Page Contains    text=Consentimento de Cookies                        timeout=00:00:20
    Click Element               xpath=//button[@id="onetrust-accept-btn-handler"]