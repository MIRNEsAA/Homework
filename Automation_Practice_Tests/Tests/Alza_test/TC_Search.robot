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
${Search}    xpath://*[@id="btnSearch"]


*** Test Cases ***
Verify the SEARCH_select option 
    [Tags]	   search_electronics
    Maximize browser window
    Write Wanted Product  
    Select Wanted Product
    See Details of Product
    
Verify the SEARCH_button 
    [Tags]	   search_electronics
    Maximize browser window    
    Write Wanted Product
    Click Element    ${Search}
    Check All Product with similar name
 
 
    
*** Keywords ***
Write Wanted Product
    Click Element    xpath://*[@id="search"]
    Input Text    xpath://*[@id="edtSearch"]        LEGO Boost 17101
    Sleep    5

Select Wanted Product
    Mouse Over    xpath://*[@id="ui-id-1"]/li[@title='LEGO Boost 17101']
    Wait Until Element Is Visible	xpath://*[@id="ui-id-1"]/li[@title='LEGO Boost 17101']	30s
    Click Link	xpath://*[@id="ui-id-1"]/li/a

See Details of Product
    ${the_SearchedProduct}  Get Text  xpath://div[@id='detailItem']/div/div/h1
    Should Be Equal As Strings    ${the_SearchedProduct}    LEGO Boost 17101   

Check All Product with similar name 
    Wait until element is visible   xpath://div[@id='tabsc']/div[@id='tabs']
    # Wait for load information
    Sleep  20
    @{cheep_goods}=  Get WebElements    xpath://div[@id='boxes']/div 
    Should Not Be Empty     ${cheep_goods}
    @{cheep_products}=  Get WebElements    xpath://div[@id='boxes']/div/div/div/a
    ${the_ChepeastProduct}  Get Text  xpath://div[@id='boxes']/div/div/div/a[1]
    Should Be Equal As Strings    ${the_ChepeastProduct}    LEGO Boost 17101
    Log    ${the_ChepeastProduct}

    