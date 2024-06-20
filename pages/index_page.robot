*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${index_title}    css=div.container h1
${departure_city_select}    name=fromPort
${destination_city_select}    name=toPort
${find_flights_button}    css=input.btn.btn-primary


*** Keywords ***

Escolher cidade de saida
    [Arguments]    ${cidade_saida}
    Element Should Be Visible    ${index_title}
    Select From List By Value    ${departure_city_select}    ${cidade_saida}
    Set Test Variable    ${cidade_saida_value}    ${cidade_saida}

Escolher cidade de chegada
    [Arguments]    ${cidade_chegada}
    Select From List By Value    ${destination_city_select}    ${cidade_chegada}
    Set Test Variable    ${cidade_chegada_value}    ${cidade_chegada}
Clicar no botão find Flights
    Click Element    ${find_flights_button}