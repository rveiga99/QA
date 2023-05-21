*Settings*

Documentation    Suite para compra de produto

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Iniciar sessão
Test Teardown    Concluir sessão

*Test Cases*

Pesquisar Iphone no site kabum
    [Tags]    pesquisa

    Consentimento
    Pesquisar produto         Iphone
    Validar retorno Iphone

Selecionar produto e adicionar ao carrinho
    [Tags]    carrinho

    Consentimento
    Navegar no menu
    Validar mudança de página
    Adicionar cooler carrinho
    Validar item no carrinho     