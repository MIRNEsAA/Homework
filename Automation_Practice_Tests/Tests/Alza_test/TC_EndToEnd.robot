*** Settings ***
Library  SeleniumLibrary
Suite Setup     Open browser    ${URL}   ${BROWSER}
Suite Teardown  Close All Browsers

*** Variables ***
${URL}          https://www.alza.cz
${BROWSER}      Chrome
${Smart}    xpath://a[contains(text(),'Smart')]
${New}    xpath://*[@id="hlCommodityStatusNew"]
${LEGO Boost 17101}    xpath://a[contains(text(),'LEGO Boost 17101')]    
${Buy}    xpath://div[@id='cpcm_cpc_tdAmount']/span/div/div/a/span[2]
${Add}    xpath://div[@id='content0']/div[2]/a[2]/span
${ADD_Finished}    xpath://div[@id='blockBtnRight']/a


*** Test Cases ***
The End To End Test 
    [Tags]	   search_electronics
    Maximize browser window       
    Click link    ${Smart}    
    Click Element    ${New}
    Choose Wanted Product
    Click Element    ${Buy}
    Click Element    ${Add}
    Click Element    ${ADD_Finished}
    Sleep    10
    Capture Page Screenshot
    
*** Keywords ***
Choose Wanted Product
    Sleep  5
    Wait until element is visible   xpath://a[contains(text(),'LEGO Boost 17101')]
    Click link    ${LEGO Boost 17101}