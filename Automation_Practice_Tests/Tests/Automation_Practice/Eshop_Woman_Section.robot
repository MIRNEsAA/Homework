*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../../Keywords/Eshop/Eshop_Keywords.txt
Variables	../../Objects/Eshop/Eshop_Objects.py
Resource    ../../Resources/Eshop/Sorting_Filtering_Variables.txt
Test Setup    Open Women Section
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
     
Czech filter Sections Dressees
    Click Element    ${Dresses_section}
    Click Element    ${Evening_dresses_subsection}
    Element Should Contain    ${Category_name}    ${EVENING_DRESSES_CAT_NAME}   
    
Czech filter Categories - Dresses
    Filter By Dresses Category
    Location Should Contain    ${FILTER_CAT_URL_DRESSES}


