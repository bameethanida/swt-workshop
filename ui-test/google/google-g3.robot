*** Settings ***
Library    SeleniumLibrary
Resource    resources-g3.robot

*** Test Cases ***
Test search keyword and verify search result on Google
    พิมพ์ google.com
    พิมพ์คำค้น
    กด Enter
    ตรวจสอบผลการค้นหา

