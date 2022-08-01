#language: pt

*** Settings ***
Resource         base.robot

Test Setup       nova sessão
Test Teardown    encerrar sessão
*** Test Cases ***
Realizar cadastro com nome inválido
    [tags]   login_error22
    Go To    ${url}       
    Login e senha    1234    efraimvasconcelos@ticto.com    123456789
    Mensagem de aviso    Insira um Nome e Sobrenome válido.
       
Realializar cadastro com email inválido
    [tags]    email_invalido
     Go To    ${url}
     Login e senha    Efraim Vasconcelos    efraimvasconcelosticto.com    123456789

Realizar cadastro com senha inválida
    [tags]    senha_invalida
     Go To    ${url}
    Login e senha    Efraim Vasconcelos    efraimvasconcelos@ticto.com    1234
    Mensagem de aviso    O campo Password deve ter no minimo 8 caracteres.
Realizar cadastro com dados corretos
    [tags]    cadastro_valido
     Go To    ${url}
    Login e senha    Efraim Vasconcelos    efraimvasconcelos@ticto.com    123456789
    Mensagem de sucesso    Usuário cadastrado com sucesso.

*** Keywords ***
Login e senha
    [Arguments]        ${usuraio}    ${email}  ${senha}

    Input Text       css:input[name="name"]      ${usuraio}
    Input Text       css:input[name="email"]     ${email}
    Input Password   css:input[name="password"]  ${senha}
    Click Button     class:mt-3

Mensagem de aviso
    [Arguments]    ${frase}

    ${message}=      Get WebElement    class:text-danger
    Should Contain    ${message.text}  ${frase}

Mensagem de sucesso
    [Arguments]    ${sucesso}

    ${message}=      Get WebElement    class:alert-success
    Should Contain    ${message.text}  ${sucesso}
