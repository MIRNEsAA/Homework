*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser To Mahara
Test Teardown    Capture Screenshot And Close Browser
Resource    Keywords/Mahara/Mahara_Keywords.robot
Resource    Variables/Mahara/Mahara_Variables.robot

*** Test Cases ***
Mahara Invalid Login
    Log In To Mahara    Invalid_Login    Invalid_Password
    Wait Until Page Contains Element    id=messages
    Page Should Contain    ${INVALID_LOGIN_ERROR1}
    Page Should Contain    ${INVALID_LOGIN_ERROR2}
Templated Invalid Login
    [Template]    Logging In With Invalid Username Or Password Should Fail
    ${USERNAME1}    invalid
    ${USERNAME2}    invalid
    ${USERNAME3}    invalid
    ${USERNAME4}    invalid
    ${USERNAME5}    invalid
    ${USERNAME1}    ${EMPTY}
    ${USERNAME2}    ${EMPTY}
    ${USERNAME3}    ${EMPTY}
    ${USERNAME4}    ${EMPTY}
    ${USERNAME5}    ${EMPTY}
    invalid    ${PASSWORD}
    ${EMPTY}    ${PASSWORD}
Valid Login With Multiple Usernames
    [Template]    Logging In With Valid Username And Password Should Pass
    ${USERNAME1}    ${PASSWORD}
    ${USERNAME2}    ${PASSWORD}
    ${USERNAME3}    ${PASSWORD}
    ${USERNAME4}    ${PASSWORD}
    ${USERNAME5}    ${PASSWORD}