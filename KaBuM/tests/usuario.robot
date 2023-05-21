*Settings*

Documentation    Suite de teste login usuário

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Iniciar sessão
Test Teardown    Concluir sessão

*Test Cases*

Usuário inválido
    [Tags]    usuario

    Consentimento
    Logar no Sistema    rafael12paiva&gmail.com    123456
    Invalido





