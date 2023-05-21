*Settings*

Documentation    Users route test suite

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Add new user

    ${user}        Factory New User
    Remove User    ${user}

    ${response}         POST User    ${user}
    Status Should Be    201          ${response}

    ${user_id}        Set Variable      ${response.json()}[id]
    Should Be True    ${user_id} > 0

Get user data

    ${user}      Factory Get User
    POST User    ${user}
    
    ${token}            Get Token    ${user}
    ${response}         GET User     ${token}
    Status Should be    200          ${response}

    Should Be Equal as Strings      ${user}[name]        ${response.json()}[name]
    Should Be Equal as Strings      ${user}[email]       ${response.json()}[email]

    Should Be Equal as Strings      None     ${response.json()}[whatsapp]
    Should Be Equal as Strings      None     ${response.json()}[avatar]
    Should Be Equal as Strings      False    ${response.json()}[is_geek]

Remove user

    ${user}      Factory Remove User
    POST User    ${user}
    
    ${token}            Get Token    ${user}
    
    ${response}         DELETE User  ${token}
    Status Should be    204          ${response}

    ${response}         GET User     ${token}
    Status Should Be    404          ${response}

Update a user

    ${user}     Factory Update User
    POST User   ${user}[before]

    ${token}        Get Token  ${user}[before]

    ${response}         PUT User    ${token}        ${user}[after]
    Status Should Be    200         ${response}

    ${response}         GET User     ${token}

    Should Be Equal as Strings      ${user}[after][name]        ${response.json()}[name]
    Should Be Equal as Strings      ${user}[after][email]       ${response.json()}[email]

    Should Be Equal as Strings      ${user}[after][whatsapp]    ${response.json()}[whatsapp]
    Should Be Equal as Strings      ${user}[after][avatar]      ${response.json()}[avatar]
    Should Be Equal as Strings      False                       ${response.json()}[is_geek]