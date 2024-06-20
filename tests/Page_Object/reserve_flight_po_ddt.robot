*** Settings ***
Resource    ../../pages/base_page.robot
Test Template    Comprar voo


*** Test Cases ***
TC001    São Paolo    New York    1    Maria    Itapecerica    Minas Gerais    MG    5512    amex    346940008088932    04    2012    Maria Aparecida
TC002    Boston     Rome    5    Carlos    Capao    Acre    AC    5513    dinersclub    38516522515379    08    2018    CArlos Manuel
TC003    Portland    Berlin    3    Aline    Santo amaro    Amapa   AP     5515    visa    346940008088931    10    2018    Aline Santos
TC004    San Diego    New York    2    Mateus    Sao jose dos campos    Amazonas    AM    551213    dinersclub    346940008088953    01    2000    mateus gonçalo
TC005    Mexico City    Cairo    4    Jose    Rio branco    Acre    AC    551290    amex    346940008088909    12    2024    Jose correia
TC006    Paris    Dublin    2    Roberto    Jabaquara    Sao Paulo    SP    5543    visa    346940008082004    02    2015    Roberto Ronaldo
TC007    Portland    Buenos Aires    5    Cristina    Copacabana    Rio de Janeiro    RJ    876251    amex    346940008080192    05    2002    Cristina Bernardo




*** Keywords ***
Comprar voo
    [Arguments]    ${departure}    ${destination}    ${opcao}    ${name}    ${address}    ${city}    ${state}    ${zipcode}    ${type_card}    ${card_number}    ${month}    ${year}    ${name_card}
    Tirar Screenshot    1-homepage
    Escolher cidade de saida    ${departure}
    Escolher cidade de chegada    ${destination}
    Tirar Screenshot    2-Destinos
    Clicar no botão find Flights
    Tirar Screenshot    3-pagina de reservar
    Element Text Should Be    ${reserve_title}    Flights from ${cidade_saida_value} to ${cidade_chegada_value}:
    Escolho a opcao de voo e clico na opcao    ${opcao}    ${cidade_saida_value}    ${cidade_chegada_value}
    Tirar Screenshot    4-Pagina purchase
    Element Text Should Be    ${title_purchase}    Your flight from TLV to SFO has been reserved.
    Inserir valores nos campos    ${name}    ${address}    ${city}    ${state}    ${zipcode}    ${type_card}    ${card_number}    ${month}    ${year}    ${name_card}
    Tirar Screenshot    5-Valores preenchidos
    Clicar em purchase flight
    Tirar Screenshot    6-Pagina agradecimento
    Element Text Should Be    ${confirmation_title}    ${confirmation_message}



    