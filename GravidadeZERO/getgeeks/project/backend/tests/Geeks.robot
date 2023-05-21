*Settings*

Documentation    Geek route test suite

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*

Be a Geek

    ${user}        Factory Be Geek
    Remove User    ${user}
    POST User      ${user}

    ${token}    Get Token    ${user}

    ${response}    POST Geek    ${token}    ${user}[geek_profile]

    Status Should Be    201    ${response}

    ${response}    Get User    ${token}

    Should Be Equal as Strings    ${user}[name]     ${response.json()}[name]
    Should Be Equal as Strings    ${user}[email]    ${response.json()}[email]

    Should Be Equal as Strings    ${user}[geek_profile][whatsapp]    ${response.json()}[whatsapp]
    Should Be Equal as Strings    ${user}[geek_profile][desc]        ${response.json()}[desc]

    ${expected_float}    Convert To Number    ${user}[geek_profile][cost]
    ${got_float}         Convert TO Number    ${response.json()}[cost]

    Should Be Equal as Strings    ${expected_float}                        ${got_float}
    Should Be Equal as Strings    ${user}[geek_profile][printer_repair]    ${response.json()}[printer_repair]
    Should Be Equal as Strings    ${user}[geek_profile][work]              ${response.json()}[work]
    Should Be Equal as Strings    None                                     ${response.json()}[avatar]
    Should Be Equal as Strings    True                                     ${response.json()}[is_geek]

Get Geek List
    [Tags]      temp

    ${user}      Factory Search For Geeks
    POST User    ${user} 

    ${token}    Get Token    ${user}    

    ${response}         GET Geeks    ${token}
    Status Should Be    200          ${response}    

    Log    ${response.json()}[Geeks]

    ${total}          Get Length      ${response.json()}[Geeks]
    Should Be True    ${total} > 0