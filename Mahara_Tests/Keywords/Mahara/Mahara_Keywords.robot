*** Settings ***
Library    SeleniumLibrary
Resource    ../../Variables/Mahara/Mahara_Variables.robot

*** Keywords ***
Open Browser To Mahara
    Open Browser    https://demo.mahara.org    chrome
    Maximize Browser Window
Log In To Mahara
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id=login_login_username    ${USERNAME}
    Input Password    name=login_password    ${PASSWORD}
    Click Button    id=login_submit
Capture Screenshot And Close Browser
    Capture Page Screenshot
    Close Browser
User Is logged In
    Wait Until Page Contains Element    class=profile-block
    Page Should Contain Element    xpath=//a[@class="user-icon"]
Error Appears When Username Or Password Is Invalid
    Wait Until Page Contains Element    id=messages
    Page Should Contain    ${INVALID_LOGIN_ERROR1}
    Page Should Contain    ${INVALID_LOGIN_ERROR2}
Logging In With Valid Username And Password Should Pass
    [Arguments]  ${USERNAME}  ${PASSWORD}
    Log In To Mahara    ${USERNAME}  ${PASSWORD}
    User is Logged In  
    Capture Screenshot And Close Browser
    Open Browser To Mahara
Logging In With Invalid Username Or Password Should Fail
    [Arguments]  ${USERNAME}  ${PASSWORD}
    Log In To Mahara    ${USERNAME}  ${PASSWORD}
    Error Appears When Username Or Password Is Invalid
    Capture Screenshot And Close Browser
    Open Browser To Mahara