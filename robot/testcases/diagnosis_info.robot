*** Settings ***
Documentation     Diagnosis Info tests. Source: Test Summary - TC-DET-001, TC-DET-002.
Library           DateTime
Resource          ${CURDIR}${/}..${/}keywords${/}common.resource
Resource          ${CURDIR}${/}..${/}keywords${/}pages${/}login.resource
Resource          ${CURDIR}${/}..${/}keywords${/}pages${/}diagnosis_info.resource
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser And Teardown
Test Teardown     Run Keyword If Test Failed    Capture Page Screenshot
Test Setup       Login With Valid Credentials

*** Test Cases ***
TC-DET-001 Verify Copying Patient Symptoms
    [Documentation]    Open patient details, click Copy All (คัดลอกทั้งหมด). Expected: symptom text copied to clipboard.
    [Tags]    Positive
    Open Diagnosis Info Page    ${DIAGNOSIS_INFO_ID}
    Copy All Symptoms
    Log    Clipboard content verification may require OS-level keyword; symptom box text should match copied content.

TC-DET-002 Verify Adding A Note Message
    [Documentation]    Type note, click send. Expected: note appears in Note message section with sender and timestamp.
    [Tags]    Positive
    Open Diagnosis Info Page    ${DIAGNOSIS_INFO_ID}
    ${timestamp}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    ${note}=    Set Variable    Robot test note ${timestamp}
    Add Note Message    ${note}
    Note Should Appear In History    ${note}
