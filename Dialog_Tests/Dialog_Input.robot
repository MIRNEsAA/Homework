*** Settings ***
Documentation    Dialog Tests
Suite Setup    Log    Setup
Suite Teardown    Log    Teardown
Library    Dialogs
Library    BuiltIn

*** Variables ***
${expected_message}    hackerschool
# to change the variable use "robot --variable expected_message:newVariable Dialog_Input.robot

*** Test Cases ***
Checking User Input
    [Documentation]    Checking user input and comparing it to the expected value.
	[Tags]  DialogInput
	Check User Input

*** Keywords ***
Check User Input 
    ${user_input}=    Get Value From User    Please enter a message.
    Log To Console    ${user_input}
    Should Be Equal    ${user_input}    ${expected_message}