*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${url}    https://www.blazedemo.com/
${browser}    Chrome
${timeout}    5000ms

*** Test Cases ***

Reservar um voo de Paris ate Londres
    Dado que acesso o site blazedemo
    Quando escolho o ponto de partida    Paris
    E Escolho o ponto de chegada    London
    E Clico em "Find Flights"
    Entao sou direcionado para as opções de voo
    Quando escolho o voo mais caro
    Entao sou direcionado para a pagina de pagamento
    Quando preencho os campos name,address, city, state,zip code    Bruno    Av Bruno    SP    Sao Paulo    551872
    E preencho Card Type, Credit card number, Month, year e nome on card    visa    4202665232145518    06    2004    Bruno Bispo
    E clico em purchase Flight
    Entao sou levado a pagina de agradecimento

*** Keywords ***
Dado que acesso o site blazedemo
    Open Browser    url=${url}    browser=${browser}
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.container h1

Quando escolho o ponto de partida
    [Arguments]    ${ponto_partida}
    Set Test Variable    ${ponto_de_partida}    ${ponto_partida}
    Select From List By Value    name=fromPort    ${ponto_partida}

E Escolho o ponto de chegada
    [Arguments]    ${ponto_chegada}
    Set Test Variable    ${ponto_de_chegada}    ${ponto_chegada}
    Select From List By Value    name=toPort    ${ponto_chegada}

E Clico em "Find Flights"
    Click Element    css=input.btn.btn-primary

Entao sou direcionado para as opções de voo
    Wait Until Element Is Visible    css=div.container h3
    Element Text Should Be    css=div.container h3    Flights from ${ponto_de_partida} to ${ponto_de_chegada}:
    ${departs_header}=    Get Text    xpath=//th[contains(text(), 'Departs: ${ponto_de_partida}')]
    Should Be Equal As Strings    ${departs_header}    Departs: ${ponto_de_partida}
    ${arrives_header}=    Get Text    xpath=//th[contains(text(), 'Arrives: ${ponto_de_chegada}')]
    Should Be Equal As Strings    ${arrives_header}    Arrives: ${ponto_de_chegada}

Quando escolho o voo mais caro
    Click Element    css=tbody > tr:nth-of-type(4) input[type="submit"][value="Choose This Flight"]

Entao sou direcionado para a pagina de pagamento
    Wait Until Element Is Visible    css=div.container h2    ${timeout}
    Element Text Should Be    css=div.container h2    Your flight from TLV to SFO has been reserved.
   
Quando preencho os campos name,address, city, state,zip code
    [Arguments]    ${name}    ${address}    ${city}    ${state}    ${zipcode}
    Input Text    id=inputName    ${name}
    Input Text    name=address    ${address}
    Input Text    name=city    ${city}
    Input Text    name=state    ${state}
    Input Text    id=zipCode    ${zipcode}

E preencho Card Type, Credit card number, Month, year e nome on card
    [Arguments]    ${type_card}    ${card_number}    ${month}    ${year}    ${name_card}
    Select From List By Value    name=cardType    ${type_card}
    Input Text    id=creditCardNumber    ${card_number}
    Input Text    id=creditCardMonth    ${month}
    Input Text    id=creditCardYear    ${year}
    Input Text    id=nameOnCard    ${name_card}

E clico em purchase Flight
    Click Element    css=.btn.btn-primary

Entao sou levado a pagina de agradecimento
    Element Text Should Be    css=.container.hero-unit h1    Thank you for your purchase today!
