*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${CHROME}    chrome
${URL}    https://www.dminer.in.th/Product-list.html
${MockCardNum}    4719700590995
${MockMonth}    7
${MockYear}    20
${MockCVV}    752
${MockName}    Karnwat Wongudom

*** Test Cases ***
User ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งเป็น kerry ชำระเงินด้วยบัตรเครดิต visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่จะซื้อ
    นำสินค้าใส่ตะกร้า
    ยืนยันการสั่งซื้อและชำระเงินด้วยบัตร Credit - VISA Card
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    ${URL}    ${CHROME}
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD
แสดงรายละเอียดสินค้า
    Click Button    id=viewMore-1
    Wait Until Element Contains    id=productName    text=43 Piece dinner Set
    Element Should Contain    id=productBrand    expected=CoolKidz
    Element Should Contain    id=productGender    expected=UNISEX
    Element Should Contain    id=productAge    expected=13+
    Element Should Contain    id=productPrice    expected=12.95 USD
ระบุจำนวนสินค้าที่จะซื้อ
    Input Text    id=productQuantity    1
นำสินค้าใส่ตะกร้า
    Click Button    id=addToCart
ยืนยันการสั่งซื้อและชำระเงินด้วยบัตร Credit - VISA Card
    Wait Until Page Contains    text=ยืนยันคำสั่งซื้อ
    Click Button    id=confirmPayment
    Wait Until Page Contains    เลขบัตร
    Input Text    id=cardNumber    ${MockCardNum}
    Input Text    id=expiredMonth    ${MockMonth}
    Input Text    id=expiredYear    ${MockYear}
    Input Text    id=cvv    ${MockCVV}
    Input Text    id=cardName    ${MockName}
    Click Button    id=Payment
ขอบคุณ
    Wait Until Element Contains    id=title    text=ชำระเงินสำเร็จ



    

