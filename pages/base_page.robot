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
    