#language: pt
*** Settings ***
Resource         base.robot
Resource    cadastro.robot

Test Setup       nova sessão
Test Teardown    encerrar sessão

*** Test Cases ***
Realizar cadastro com dados corretos
    Login e senha    Efraim Vasconcelos    efraimvasconcelos@gmail.com    123456789 
                
    ${message}=      Get WebElement    class:alert-success
    Should Contain    ${message.text}  Usuário cadastrado com sucesso.

Validar cadastro relizado
    Go To    ${url}
    Table Row Should Contain    class:table-striped    1    Efraim Vasconcelos
*** Keywords ***
Login e senha
    [Arguments]        ${usuraio}    ${email}  ${senha}

    Input Text       css:input[name="name"]      ${usuraio}
    Input Text       css:input[name="email"]     ${email}
    Input Password   css:input[name="password"]  ${senha}
    Click Button     class:mt-3
