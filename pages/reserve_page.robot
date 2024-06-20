*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${reserve_title}    css=div.container h3



*** Keywords ***
Escolho a opcao de voo e clico na opcao
    [Arguments]    ${opcao_de_voo}    ${saida}    ${chegada}
    ${chose_flight}    Set Variable    css=tbody > tr:nth-of-type(${opcao_de_voo}) input[type="submit"][value="Choose This Flight"]
    Click Element    ${chose_flight}




