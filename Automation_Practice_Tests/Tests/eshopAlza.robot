*** Settings ***
Library  SeleniumLibrary
Suite Setup     Open browser    ${URL}   ${BROWSER}
#Suite Teardown  Close All Browsers

*** Variables ***
${URL}          https://www.alza.cz
${BROWSER}      Chrome

*** Test Cases ***
The End To End Test 
    [Tags]	   search_electronics2
    Maximize browser window
    Click link    xpath://a[contains(text(),'Smart')]    
    Click Element    xpath://*[@id="hlCommodityStatusNew"]
    Sleep  5
    Wait until element is visible   xpath://a[contains(text(),'LEGO Boost 17101')]
    Click link    xpath://a[contains(text(),'LEGO Boost 17101')]
    Click Element    xpath://div[@id='cpcm_cpc_tdAmount']/span/div/div/a/span[2]
    Click Element    xpath://div[@id='content0']/div[2]/a[2]/span
    Click Element    xpath://div[@id='blockBtnRight']/a
    Sleep    10
    Capture Page Screenshot
The user can search without select price
    [Tags]	   search_electronics2
    Click link    xpath://*[@id="left"]/ul/li[3]/div/a    
    Click Element    xpath://*[@id="hlCommodityStatusNew"]
    @{goods}=  Get WebElements    xpath://div[class='boxc']//descendant::a[@class='name browsinglink']
    Click link    xpath://*[id="boxes"]//div[2]/a
    
The user can search for goods
    [Tags]	   search_electronics1
    Click link    xpath://*[@id="left"]/ul/li[3]/div/a    
    Input Text     xpath=//*[@id='lblMinPrice']    500
    Input Text      xpath=//*[@id='lblMaxPrice']   800
    @{goods}=  Get WebElements    xpath://div[class='boxc']//descendant::a[@class='name browsinglink']
    Should Not Be Empty     ${goods}
     
