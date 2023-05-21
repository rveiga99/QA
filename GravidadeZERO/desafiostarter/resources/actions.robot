*Settings*

Documentation    Arquivo com as ações do desafio Starter

*Keywords*

Validar Acesso a Home
    Wait For Elements State    css=.navbar    visible    5   

Valor Saldo
    [Arguments]    ${valor_saldo}

    ${element}    Set Variable    css=.navbar-end >> text="Olá Papito, seu saldo é R$ ${valor_saldo}"    

    Wait For Elements State    ${element}
    ...                        visible       5

    Get Text    ${element}    contains    ${valor_saldo}

Clicar botão PIX

    Click    css=.button >> text=Fazer PIX
    Click    xpath=//div/..//span//select


Fazer PIX
    [Arguments]    ${pix_valor}    ${banco}    ${chave}

    Select Options By    xpath=//span//select              text            ${banco}    
    Fill Text            xpath=//input[@id="chave-pix"]    ${chave}        
    Fill Text            xpath=//input[@id="valor"]        ${pix_valor}    

    Click    css=.button >> text=Enviar PIX 

Validar valor PIX zerado

    ${element}    Set Variable    css=.media .media-content >> text="Oops. Transferir ZERO é osso hein..."
    Get Text      ${element}      

Validar valor PIX negativo

    ${element}         Set Variable                 css=.media .media-content >> text="Oops. Valor para PIX incorreto..."
    Get Text           ${element}
    take Screenshot    css=//div[@class="media-content"]


