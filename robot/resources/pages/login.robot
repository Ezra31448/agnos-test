*** Settings ***
Resource    ../common.robot
Resource    ../../config/config.robot

*** Keywords ***
Login With Credentials
    [Documentation]    Enters email and password then clicks Sign in button. Waits until Diagnosis List page is shown.
    [Arguments]    ${email}=${LOGIN_EMAIL}    ${password}=${LOGIN_PASSWORD}
    Wait Until Element Is Visible    ${LOGIN_EMAIL_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text    ${LOGIN_EMAIL_INPUT}    ${email}
    Input Password    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT_BTN}
    Wait Until Page Contains    Diagnosis List    timeout=${EXPLICIT_WAIT}

User Should Be On AI Screening Dashboard
    [Documentation]    Verifies that the user is on the Diagnosis List page (AI Screening Dashboard).
    Wait Until Page Contains    Diagnosis List    timeout=${EXPLICIT_WAIT}
    ${loc}=    Get Location
    Should Not Contain    ${loc}    login

Log Out From Dashboard
    [Documentation]    Clicks the Log Out button (bottom left).
    Wait Until Element Is Visible    ${LOGOUT_BTN}    timeout=${EXPLICIT_WAIT}
    Click Element    ${LOGOUT_BTN}

User Should Be Redirected To Login Page
    [Documentation]    Verifies current location is login page.
    Wait Until Location Contains    login    timeout=${EXPLICIT_WAIT}
