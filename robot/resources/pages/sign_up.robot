*** Settings ***
Resource    ../common.robot
Resource    ../../config/config.robot

*** Keywords ***
Fill Sign Up Form
    [Documentation]    Fills email, password, and confirm password on sign-up page.
    [Arguments]    ${email}    ${password}    ${confirm_password}=${password}
    Wait Until Element Is Visible    ${SIGNUP_EMAIL_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text    ${SIGNUP_EMAIL_INPUT}    ${email}
    Input Password    ${SIGNUP_PASSWORD_INPUT}    ${password}
    Input Password    ${SIGNUP_CONFIRM_INPUT}    ${confirm_password}

Submit Sign Up Form
    [Documentation]    Clicks the Confirm button on sign-up form.
    Click Element    ${SIGNUP_CONFIRM_BTN}

Register With Valid Data
    [Documentation]    Fills and submits sign-up with valid email and password (same for confirm).
    [Arguments]    ${email}=${REG_VALID_EMAIL}    ${password}=${REG_VALID_PASSWORD}
    Fill Sign Up Form    ${email}    ${password}    ${password}
    Submit Sign Up Form

Submit Sign Up With All Blank Fields
    [Documentation]    Ensures fields are empty and clicks Confirm (for validation tests).
    Clear Element Text    ${SIGNUP_EMAIL_INPUT}
    Clear Element Text    ${SIGNUP_PASSWORD_INPUT}
    Clear Element Text    ${SIGNUP_CONFIRM_INPUT}
    Submit Sign Up Form

Enter Email And Trigger Validation
    [Documentation]    Types email and triggers blur (Tab or click outside) for validation.
    [Arguments]    ${email}
    Input Text    ${SIGNUP_EMAIL_INPUT}    ${email}
    Click Outside To Trigger Validation

Enter Password And Trigger Validation
    [Documentation]    Types email, password and triggers blur for validation.
    [Arguments]    ${password}    ${email}=tc04@gmail.com
    Input Text    ${SIGNUP_EMAIL_INPUT}    ${email}
    Input Password    ${SIGNUP_PASSWORD_INPUT}    ${password}
    Click Outside To Trigger Validation

Password Field Should Show Error
    [Documentation]    Verifies password criteria error message is visible.
    [Arguments]    ${message_fragment}
    Element Should Show Error Message    ${message_fragment}

Confirm Password Field Should Show Mismatch Error
    [Documentation]    Verifies "Confirm password does not match" (or similar) is shown.
    Element Should Show Error Message    Confirm password
    Element Should Show Error Message    match

Toggle Password Visibility
    [Documentation]    Clicks the password visibility toggle (eye icon) next to password field.
    Click Element    ${SIGNUP_PASSWORD_TOGGLE}

Password Should Be Masked
    [Documentation]    Asserts password input type is password (masked).
    Element Attribute Value Should Be    ${SIGNUP_PASSWORD_INPUT}    type    password

Password Should Be Visible
    [Documentation]    Asserts password input type is text (visible). Some UIs use type=text when toggled.
    Element Attribute Value Should Be    ${SIGNUP_PASSWORD_INPUT}    type    text

Sign Up Page Should Be Visible
    [Documentation]    Asserts we are on sign-up page (form visible).
    Wait Until Element Is Visible    ${SIGNUP_CONFIRM_BTN}    timeout=${EXPLICIT_WAIT}

Redirected To Login Or Dashboard After Register
    [Documentation]    Verifies URL changed to login or dashboard after successful registration.
    Wait Until Keyword Succeeds    10s    1s    Check Location Is Login Or Dashboard

Check Location Is Login Or Dashboard
    ${loc}=    Get Location
    Should Be True    'login' in '${loc}' or 'ai_dashboard' in '${loc}'    msg=Expected redirect to login or dashboard
