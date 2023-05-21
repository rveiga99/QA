*Settings*

Documentation    Session route test suite

Library    RequestsLibrary

Resource    ${EXECDIR}/resources/Base.robot

*Variables*

&{inv_pass}       email=teste@hotmail.com    password=abc123
&{inv_email}      email=teste.com.br         password=abc123
&{email_404}      email=teste@404.com        password=abc123
&{empty_email}    email=${EMPTY}             password=abc123
&{wo_email}       password=abc123
&{empty_pass}     email=teste@hotmail.com    password=${EMPTY}
&{wo_pass}        email=teste@hotmail.com    

*Test Cases*
User session

    ${payload}    Factory User Session    signup    
    POST User     ${payload}

    ${payload}    Factory User Session    login

    ${response}    POST Session    ${payload}    

    Status Should Be    200    ${response}

    ${size}    Get Length    ${response.json()}[token]    

    Should Be True     ${size} > 0
    Should Be Equal    10d            ${response.json()}[expires_in]

Should Not Get token
    [Template]    Attempt POST Session

    ${inv_pass}       401    Unauthorized
    ${inv_email}      400    Incorrect email
    ${email_404}      401    Unauthorized
    ${empty_email}    400    Required email
    ${wo_email}       400    Required email
    ${empty_pass}     400    Required pass
    ${wo_pass}        400    Required pass

*Keywords*
Attempt POST Session
    [Arguments]    ${payload}    ${status_code}    ${error_message}

    ${response}    POST Session    ${payload}

    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]    