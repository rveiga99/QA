*Settings*

Documentation    Suite de testes do PIX

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/dados.py

Suite Setup      Start Session
Test Teardown    End Session

*Test Cases*
Deve fazer PIX
    [Tags]    pix

    &{dados}    Factory pix normal
    
    Validar Acesso a Home
    Valor Saldo              1000
    Clicar botão PIX
    Fazer PIX  &{dados}
    Valor Saldo  900    

Deve validar PIX com valor Zero
    [Tags]   pix_zero

    &{dados}    Factory pix zero

    Validar Acesso a Home
    Valor Saldo  1000
    Clicar botão PIX
    Fazer PIX  &{dados}
    Validar valor PIX zerado

Deve validar PIX com valor negativo
    [Tags]   pix_negativo

    &{dados}    Factory pix negativo

    Validar Acesso a Home
    Valor Saldo  1000
    Clicar botão PIX
    Fazer PIX  &{dados}
    Validar valor PIX negativo