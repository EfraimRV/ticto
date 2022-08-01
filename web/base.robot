#language: pt
*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://qa-test.ticto.io/


*** Keywords ***
nova sessão
    Open Browser        ${url}        chrome

encerrar sessão
    Capture Page Screenshot
    Close Browser