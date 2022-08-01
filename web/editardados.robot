#language: pt
*** Settings ***
Resource         base.robot

Test Setup       nova sessão
Test Teardown    encerrar sessão

*** Test Cases ***
Editar meu nome de forma inválida
    Go To            ${url}
    Click Button     class:dropdown-toggle
    Click Element    class:dropdown-item
    Editar dados    1234    efraimvasconcelos@ticto.com
        
    Press Keys       css:input[name="e_email"]    ENTER
    
    ${message}=      Get WebElement    class:text-danger
    Should Contain    ${message.text}  Insira um Nome e Sobrenome válido.

Editar meu email de forma inválida
    Go To            ${url}
    Click Button     class:dropdown-toggle
    Click Element    class:dropdown-item
    Editar dados    Efraim Vasconcelos    efraimvasconcelosticto.com
        
    Press Keys    css:input[name="e_email"]    ENTER

Editando meus dados corretamente retirando a letra S
    Go To            ${url}
    Click Button     class:dropdown-toggle
    Click Element    class:dropdown-item
    Editar dados    Efraim Vasconcelos    efraimvasconcelo@ticto.com
        
    Press Keys    css:input[name="e_email"]    ENTER

Validar cadastro relizado
    Go To    ${url}
    Table Row Should Contain    class:table-striped    1    Efraim Vasconcelo
    Table Row Should Contain    class:table-striped    1    efraimvasconcelo@ticto.com

*** Keywords ***
Editar dados
    [Arguments]    ${nome}    ${email} 
    Input Text       css:input[name="e_name"]      ${nome}
    Input Text       css:input[name="e_email"]     ${email} 