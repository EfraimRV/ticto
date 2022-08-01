#language: pt
*** Settings ***
Resource         base.robot
Resource    cadastro.robot

Test Setup       nova sessão
Test Teardown    encerrar sessão
Library    Process

*** Test Cases ***
Realizar cadastro com dados corretos
    Go To    ${url}
    Login e senha    Efraim Vasconcelos    efraimvasconcelos@ticto.com    12345678
    Mensagem de sucesso    Usuário cadastrado com sucesso.
    Sleep    5

Editar meu nome de forma inválida
    Go To            ${url}
    Click Button     class:dropdown-toggle
    Sleep    5
    Click Element    css:a[href="#modalDelete708"]
    Sleep     5
    Click Button     class:btn-danger
    Sleep    4

*** Keywords ***
Login e senha
    [Arguments]        ${usuraio}    ${email}  ${senha}

    Input Text       css:input[name="name"]      ${usuraio}
    Input Text       css:input[name="email"]     ${email}
    Input Password   css:input[name="password"]  ${senha}
    Click Button     class:mt-3

Mensagem de sucesso
    [Arguments]    ${sucesso}

    ${message}=      Get WebElement    class:alert-success
    Should Contain    ${message.text}  ${sucesso}

    