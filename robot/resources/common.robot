*** Settings ***
Resource    ../config/config.robot
Library     SeleniumLibrary    implicit_wait=${IMPLICIT_WAIT}

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Opens browser and navigates to the login page. Uses headless Chrome when CI=true.
    Run Keyword If    '${CI}'=='true'    Open Browser    ${LOGIN_URL}    Chrome    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-gpu");add_argument("--window-size=1920,1080")
    ...    ELSE    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s

Open Browser To Sign Up Page
    [Documentation]    Opens browser and navigates to the sign-up page. Uses headless Chrome when CI=true.
    Run Keyword If    '${CI}'=='true'    Open Browser    ${SIGN_UP_URL}    Chrome    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-gpu");add_argument("--window-size=1920,1080")
    ...    ELSE    Open Browser    ${SIGN_UP_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s

Open Browser To Dashboard
    [Documentation]    Opens browser and navigates to the dashboard (assumes login required separately). Uses headless when CI=true.
    Run Keyword If    '${CI}'=='true'    Open Browser    ${DASHBOARD_URL}    Chrome    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-gpu");add_argument("--window-size=1920,1080")
    ...    ELSE    Open Browser    ${DASHBOARD_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s

Close Browser And Teardown
    [Documentation]    Closes browser and optionally capture screenshot on failure (screenshot in test teardown).
    Close Browser

Login With Valid Credentials
    [Documentation]    Performs login with default test credentials. Call after opening browser to login page.
    [Arguments]    ${email}=${LOGIN_EMAIL}    ${password}=${LOGIN_PASSWORD}
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    ${LOGIN_EMAIL_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text    ${LOGIN_EMAIL_INPUT}    ${email}
    Input Password    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT_BTN}
    Wait Until Location Contains    ai_dashboard    timeout=${EXPLICIT_WAIT}

Ensure On Sign Up Page
    [Documentation]    Navigates to sign-up page if not already there.
    ${current}=    Get Location
    Run Keyword If    '''sign_up''' not in '''${current}'''    Go To    ${SIGN_UP_URL}
    Wait Until Element Is Visible    ${SIGNUP_EMAIL_INPUT}    timeout=${EXPLICIT_WAIT}

Ensure On Dashboard
    [Documentation]    Navigates to dashboard if not already there (user must be logged in).
    ${current}=    Get Location
    Run Keyword If    '''ai_dashboard''' not in '''${current}''' or '''login''' in '''${current}'''    Go To    ${DASHBOARD_URL}
    Wait Until Page Contains Element    ${DASHBOARD_SEARCH_INPUT}    timeout=${EXPLICIT_WAIT}

Click Outside To Trigger Validation
    [Documentation]    Clicks elsewhere (e.g. body or label) to trigger blur validation.
    Press Keys    body    \\9
    Sleep    0.3s

Element Should Show Error Message
    [Documentation]    Verifies that an error message is visible near the given scope (e.g. below a field).
    [Arguments]    ${message_contains}    ${scope}=xpath://body
    Wait Until Element Is Visible    xpath://*[contains(text(),'${message_contains}')]    timeout=5s
    Element Should Be Visible    xpath://*[contains(text(),'${message_contains}')]

Form Should Show Required Errors
    [Documentation]    Verifies that required field validation errors are shown (e.g. "This field is required").
    Wait Until Page Contains    required    timeout=5s
    Page Should Contain    required
