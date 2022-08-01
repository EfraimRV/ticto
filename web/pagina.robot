#language: pt

*** Settings ***
Resource         base.robot

Test Setup       nova sessão
Test Teardown    encerrar sessão

*** Test Cases ***
validar se a pagina abre normalmente
  Title Should Be    Teste QA
  