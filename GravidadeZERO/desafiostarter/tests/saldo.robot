*Settings*

Documentation    Suite dos testes de saldo em conta

Resource    ${EXECDIR}/resources/base.robot

Suite Setup      Start Session
Test Teardown    End Session

*Test Cases*
Deve validar saldo inicial
    [Tags]    inicial

    Validar Acesso a Home
    Valor Saldo              1000






