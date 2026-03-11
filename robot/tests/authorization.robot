*** Settings ***
Documentation     Authorization (Login / Logout) tests. Source: Test Summary - TC-AUTH-001, TC-AUTH-002.
Resource          ../resources/common.robot
Resource          ../resources/pages/login.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser And Teardown
Test Teardown     Run Keyword If Test Failed    Capture Page Screenshot

*** Test Cases ***
TC-AUTH-001 Verify Successful Login With Valid Credentials
    [Documentation]    Login with valid credentials. Expected: system authenticates and opens AI Screening Dashboard.
    [Tags]    Positive    Regression
    Login With Credentials    ${LOGIN_EMAIL}    ${LOGIN_PASSWORD}
    User Should Be On AI Screening Dashboard

TC-AUTH-002 Verify Successful Logout And Session Termination
    [Documentation]    Log out then use browser Back. Expected: redirected to Login; Back should not allow access to dashboard.
    [Tags]    Positive    Regression
    Go To    ${LOGIN_URL}
    Login With Credentials    ${LOGIN_EMAIL}    ${LOGIN_PASSWORD}
    User Should Be On AI Screening Dashboard
    Log Out From Dashboard
    User Should Be Redirected To Login Page
    Go Back
    Wait Until Element Is Visible    ${LOGIN_EMAIL_INPUT}    timeout=${EXPLICIT_WAIT}
