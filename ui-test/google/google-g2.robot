*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com
${CHROME}    chrome
${KEYWORD}     USElection2020
${EXPECTED_RESULT}    US Election 2020 - BBC News

*** Test Cases ***
Test search keyword and verify search result on Google
    พิมพ์ google.com
    พิมพ์คำค้น
    กด Enter
    ตรวจสอบผลการค้นหา

*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${CHROME}

พิมพ์คำค้น
    Input Text    name:q    ${KEYWORD}

กด Enter
    Press Keys    name:q    RETURN

ตรวจสอบผลการค้นหา
    Page Should Contain    ${EXPECTED_RESULT}
    Close Browser