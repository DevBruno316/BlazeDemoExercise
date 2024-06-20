*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${title_purchase}    css=div.container h2
${name_purchase}    id=inputName   
${adress_purchase}    name=address    
${city_purchase}    name=city    
${state_purchase}    name=state    
${zip_purchase}    id=zipCode
${card_type_purchase}    name=cardType
${type_card_purchase}    id=creditCardNumber
${month_card_purchase}    id=creditCardMonth
${year_card_purchase}    id=creditCardYear
${name_card_purchase}    id=nameOnCard

*** Keywords ***

Inserir valores nos campos
    [Arguments]    ${name}    ${address}    ${city}    ${state}    ${zipcode}    ${type_card}    ${card_number}    ${month}    ${year}    ${name_card}

    Input Text    id=inputName    ${name}
    Input Text    name=address    ${address}
    Input Text    name=city    ${city}
    Input Text    name=state    ${state}
    Input Text    id=zipCode    ${zipcode}
    Select From List By Value    name=cardType    ${type_card}
    Input Text    id=creditCardNumber    ${card_number}
    Input Text    id=creditCardMonth    ${month}
    Input Text    id=creditCardYear    ${year}
    Input Text    id=nameOnCard    ${name_card}

Clicar em purchase flight
    Click Element    css=.btn.btn-primary
