*Settings*

Documentation       Arquivo base do desafio starter do Gravidade Zero

Library         Browser
Resource        actions.robot

*Variables*

${URL_BASE}    https://nbank.vercel.app/   

*Keywords*
Start Session
    New Browser        chromium        headless=False     slowMo=00:00:01    
    New Page           ${URL_BASE}

End Session
    Take Screenshot    
    

