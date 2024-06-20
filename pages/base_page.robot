*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    index_page.robot
Resource    reserve_page.robot
Resource    purchase_page.robot
Resource    confirmation_page.robot

*** Variables ***
${timeout}    5000ms
${url}    https://www.blazedemo.com/
${browser}    Chrome
${date}

*** Keywords ***

Abrir Navegador
    Register Keyword To Run On Failure    Tirar Screenshot
    Open Browser    ${url}    ${browser}
    Set Browser Implicit Wait    10000ms
Fechar Navegador
    sleep    500ms
    Close Browser

Obter data e hora
    ${date}=    Get Current Date
    ${date}=    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    ${date}    Set Global Variable    ${date}

Tirar Screenshot
    [Arguments]    ${screenshot_name}

    Capture Page Screenshot    screenshots/blazedemo/${date}/${TEST_NAME}/${screenshot_name}.jpg