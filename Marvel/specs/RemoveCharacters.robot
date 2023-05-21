*Settings*
Documentation    Suite de Teste de exclusão de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Xmen.py

Suite Setup    Super Setup    rafael12paiva@gmail.com

*Test Cases*
Deve remover um personagem pelo ID

    ${personagem}    Factory Ciclope
    ${ciclope}       POST New Character    ${personagem}
    ${ciclope_id}    Set Variable          ${ciclope.json()}[_id]

    ${response}    DELETE Character By ID    ${ciclope_id}

    Status Should Be    204    ${response}    

    ${response2}    GET Character By ID    ${ciclope_id}

    Status Should Be    404    ${response2} 

Não deve remover o personagem pelo ID inexistente

    ${personagem_id}    Get Unique Id

    ${response}    DELETE Character By ID    ${personagem_id}

    Status Should Be    404    ${response}

