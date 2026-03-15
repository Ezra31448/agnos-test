*** Settings ***
Documentation     Agnos app flow tests. Test data creation via AI flow.
Resource          ${CURDIR}${/}..${/}keywords${/}common.resource
Resource          ${CURDIR}${/}..${/}keywords${/}pages${/}agnos_app.resource
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser And Teardown
Test Setup        agnos_app.Login With Valid Credentials

*** Test Cases ***
TC-AGNOS-000 Test Data Creation
    [Documentation]    Prepare test data for the test.
    [Tags]    test-1
    Create Test Data
    Log    Test Data Creation
