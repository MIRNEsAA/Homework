*** Settings ***
Library  SeleniumLibrary
Library           String
Library           Collections
Library           XML
Suite Setup     Open browser    ${URL}   ${BROWSER}
Suite Teardown  Close All Browsers

*** Variables ***
${URL}          https://www.alza.cz
${BROWSER}      Chrome

*** Test Cases ***
Verify that the most sold products are displayed
    [Tags]	   search_electronics
    Maximize browser window
    Click link    xpath://a[contains(text(),'Smart')]    
    Click Element    xpath://*[@id="hlCommodityStatusNew"]
    Sleep  5
    Wait until element is visible   xpath://div[@id='bestcat']//div[@id='best']
    # There are shown products
    @{goods}=  Get WebElements    xpath://div[@id='besti']/div
    Should Not Be Empty     ${goods}
    @{prices}=  Get WebElements     xpath://div[@id='besti']/div/div[@class='b3']/span[@class='b32'] 
    Should Not Be Empty    ${prices} 
    ${prices_length}=       get length  ${prices}
    Should be Equal as Integers  ${prices_length}  3
   

    