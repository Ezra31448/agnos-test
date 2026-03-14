*** Settings ***
Documentation     Register (Sign-Up) tests. Source: Test Summary - TC-REG-001 to TC-REG-010.
Resource          ${CURDIR}${/}..${/}resources${/}common.resource
Resource          ${CURDIR}${/}..${/}resources${/}pages${/}sign_up.resource
Suite Setup       Open Browser To Sign Up Page
Suite Teardown    Close Browser And Teardown
Test Teardown     Run Keyword If Test Failed    Capture Page Screenshot

*** Test Cases ***
TC-REG-001 Verify Successful User Registration With Valid Inputs
    [Documentation]    Verify successful user registration with valid inputs. Expected: system registers and redirects to Login or Dashboard.
    [Tags]    Positive    Regression    Smoke
    Register With Valid Data    ${REG_VALID_EMAIL}    ${REG_VALID_PASSWORD}
    Redirected To Login Or Dashboard After Register

TC-REG-002 Verify Submission With All Blank Fields
    [Documentation]    Verify submission with all blank fields. Expected: form not submitted; required fields highlighted or validation errors shown.
    [Tags]    Negative
    Ensure On Sign Up Page
    Submit Sign Up With All Blank Fields
    Form Should Show Required Errors

TC-REG-003 Verify E-mail Field With Invalid Formats
    [Documentation]    Verify email field shows error for invalid formats (missing @, missing domain). Expected: error e.g. 'The email should be in the format test@example.com'.
    [Tags]    Negative    Smoke    Regression
    Ensure On Sign Up Page
    Enter Email And Trigger Validation    ${REG_INVALID_EMAIL_NO_AT}
    Element Should Show Error Message    @
    Clear Element Text    ${SIGNUP_EMAIL_INPUT}
    Wait Until Element Is Visible    ${SIGNUP_EMAIL_INPUT}    timeout=3s
    Enter Email And Trigger Validation    ${REG_INVALID_EMAIL_NO_DOMAIN}
    Element Should Show Error Message    format

TC-REG-004 Verify Password Criteria Less Than 8 Characters
    [Documentation]    Password less than 8 chars. Expected: error "The password must be at least 8 characters long"; Confirm disabled or submission prevented.
    [Tags]    Negative    Regression
    Ensure On Sign Up Page
    Enter Password And Trigger Validation    ${REG_SHORT_PASSWORD}
    Password Field Should Show Error    8 characters

TC-REG-005 Verify Password Criteria No Uppercase Letter
    [Documentation]    Password without uppercase. Expected: error regarding uppercase letter.
    [Tags]    Negative    Regression
    Ensure On Sign Up Page
    Enter Password And Trigger Validation    ${REG_NO_UPPERCASE_PASSWORD}    ${REG_TEST_EMAIL_TC05}
    Password Field Should Show Error    uppercase

TC-REG-006 Verify Password Criteria No Digit
    [Documentation]    Password without digit. Expected: error regarding digit.
    [Tags]    Negative    Regression
    Ensure On Sign Up Page
    Enter Password And Trigger Validation    ${REG_NO_DIGIT_PASSWORD}    ${REG_TEST_EMAIL_TC06}
    Password Field Should Show Error    digit

TC-REG-007 Verify Password Criteria No Special Character
    [Documentation]    Password without special character. Expected: error regarding special character.
    [Tags]    Negative    Smoke    Regression
    Ensure On Sign Up Page
    Enter Password And Trigger Validation    ${REG_NO_SPECIAL_PASSWORD}    ${REG_TEST_EMAIL_TC07}
    Password Field Should Show Error    special

TC-REG-008 Verify Confirm Password Mismatch
    [Documentation]    Confirm password different from password. Expected: error "Confirm password does not match the password."
    [Tags]    Negative
    Ensure On Sign Up Page
    Fill Sign Up Form    ${REG_TEST_EMAIL_TC08}    ${REG_VALID_PASSWORD}    ${REG_MISMATCH_CONFIRM}
    Click Outside To Trigger Validation
    Confirm Password Field Should Show Mismatch Error

TC-REG-009 Verify Password Visibility Toggle
    [Documentation]    Password masked by default; eye icon toggles to visible and back to masked.
    [Tags]    Negative
    Ensure On Sign Up Page
    Input Password    ${SIGNUP_PASSWORD_INPUT}    ${REG_VALID_PASSWORD}
    Password Should Be Masked
    Toggle Password Visibility
    Sleep    0.3s
    Toggle Password Visibility
    Sleep    0.3s
    Password Should Be Masked

TC-REG-010 Verify Registration Fails With Already Registered Email
    [Documentation]    Use existing email; expected: system prevents registration and shows email already in use error.
    [Tags]    Negative    Regression    test-1
    Ensure On Sign Up Page
    Register With Valid Data    ${REG_VALID_EMAIL}    ${REG_VALID_PASSWORD}
    Element Should Show Error Message    already 
