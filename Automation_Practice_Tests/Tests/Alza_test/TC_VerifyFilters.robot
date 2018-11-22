*** Settings ***
Library  SeleniumLibrary
Library           String
Library           Collections
Library           XML
Suite Setup     Open browser    ${URL}   ${BROWSER}
#Suite Teardown  Close All Browsers

*** Variables ***
${URL}          https://www.alza.cz
${BROWSER}      Chrome

*** Test Cases ***
Verify the filter 
    [Tags]	   search_electronics
    Maximize browser window
    Click link    xpath://a[contains(text(),'Smart')]    
    Click Element    xpath://*[@id="hlCommodityStatusNew"]
    Sleep  5
    Wait until element is visible   xpath://div[@id='tabsc']/div[@id='tabs']
    Click Element    xpath://*[@id="tabs"]/ul/li[3]
    Scroll Page To Location    0    1500
    # Wait for load information
    Sleep  20
    @{cheep_goods}=  Get WebElements    xpath://div[@id='boxes']/div 
    Should Not Be Empty     ${cheep_goods}
    @{cheep_products}=  Get WebElements    xpath://div[@id='boxes']/div/div/div/a
    ${the_ChepeastProduct}  Get Text  xpath://div[@id='boxes']/div/div/div/a[1]
    # Website is very dinamic so name of product could be changed
    Should Be Equal As Strings    ${the_ChepeastProduct}    EHANG 184 AAV
    Log    ${the_ChepeastProduct}
    
    
      
*** Keywords ***
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
    
    
