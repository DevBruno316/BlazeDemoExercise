*** Settings ***
Resource    ../../pages/base_page.robot


*** Test Cases ***

Comprar voo
    Tirar Screenshot    1-homepage
    Escolher cidade de saida    Philadelphia
    Escolher cidade de chegada    Buenos Aires
    Tirar Screenshot    2-Destinos
    Clicar no botão find Flights
    Tirar Screenshot    3-pagina de reservar
    Element Text Should Be    ${reserve_title}    Flights from ${cidade_saida_value} to ${cidade_chegada_value}:
    Escolho a opcao de voo e clico na opcao    2    ${cidade_saida_value}    ${cidade_chegada_value}
    Tirar Screenshot    4-Pagina purchase
    Element Text Should Be    ${title_purchase}    Your flight from TLV to SFO has been reserved.
    Inserir valores nos campos    Bruno    Marginal    Sao Paulo    SP    5512    visa    55186652    07    2004    Bruno Bispo
    Tirar Screenshot    5-Valores preenchidos
    Clicar em purchase flight
    Tirar Screenshot    6-Pagina agradecimento
    Element Text Should Be    ${confirmation_title}    ${confirmation_message}



    