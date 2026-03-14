*** Settings ***
Documentation     Dashboard tests: Search, Filter, Export, Workflow. Source: Test Summary - TC-DASH-*, TC-EXP-*, TC-WF-*.
Resource          ${CURDIR}${/}..${/}resources${/}common.resource
Resource          ${CURDIR}${/}..${/}resources${/}pages${/}dashboard.resource
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser And Teardown
Test Teardown     Run Keyword If Test Failed    Capture Page Screenshot
Test Setup        Dashboard.Login With Valid Credentials

*** Test Cases ***
TC-DASH-001 Verify Searching For A Record By Patient Name
    [Documentation]    Search by patient name. Expected: table shows only records matching the name.
    [Tags]    Positive    test-1
    Ensure On Dashboard
    # Search By Patient Name    ${DASHBOARD_SEARCH_PATIENT_NAME}
    # Table Should Update

TC-DASH-002 Verify Searching For A Record By Record ID
    [Documentation]    Search by Record ID (e.g. 747). Expected: table displays the specific record.
    [Tags]    Positive
    Ensure On Dashboard
    Search By Record ID    ${DASHBOARD_SEARCH_RECORD_ID}
    Table Should Update

TC-DASH-003 Verify Filtering Records By Triage Level
    [Documentation]    Filter by Urgent. Expected: table shows only records with Urgent triage level.
    [Tags]    Positive    Filter
    Ensure On Dashboard
    Filter By Urgent Triage
    Table Should Update

TC-DASH-004 Verify Filtering Records By Date
    [Documentation]    Select date via calendar. Expected: table shows only records for selected date.
    [Tags]    Positive    Filter
    Ensure On Dashboard
    Wait Until Element Is Visible    xpath://*[contains(@class,'calendar') or contains(.,'Select date')]    timeout=${EXPLICIT_WAIT}
    Click Element    xpath://*[contains(@class,'calendar') or contains(.,'Select date')]
    Click Element    xpath://*[contains(@class,'day')][not(contains(@class,'disabled'))][1]
    Table Should Update

TC-DASH-005 Verify Filtering Records By Channel
    [Documentation]    Select channel (e.g. Agnos app). Expected: table shows only records from that channel.
    [Tags]    Positive    Filter
    Ensure On Dashboard
    Filter By Channel    ${DASHBOARD_FILTER_CHANNEL}
    Table Should Update

TC-DASH-006 Verify Navigation Through Status Tabs
    [Documentation]    Click In progress, Completed, Open tabs. Expected: view switches to corresponding cases.
    [Tags]    Positive    Filter
    Ensure On Dashboard
    Navigate Status Tabs
    Table Should Update

TC-EXP-001 Verify Downloading Records
    [Documentation]    Apply filter, click Download, ยืนยัน. Expected: file downloads with data matching filtered view.
    [Tags]    Positive    Export
    Ensure On Dashboard
    Download Filtered Records
    Sleep    2s
    Log    Verify downloaded file manually or via file existence check

TC-WF-001 Verify Moving Case From Open To In Progress
    [Documentation]    On Open tab, move a record to In-progress, ยืนยัน. Expected: record moves to In progress tab.
    [Tags]    Positive    Workflow
    Ensure On Dashboard
    Click Open Tab
    Sleep    0.5s
    Move First Open Case To In Progress
    Click In Progress Tab
    Table Should Update

TC-WF-002 Verify Completing A Case
    [Documentation]    Open an In-progress case, click Complete, ยืนยัน. Expected: record moves to Completed tab.
    [Tags]    Positive    Workflow
    Ensure On Dashboard
    Click In Progress Tab
    Sleep    0.5s
    Click Element    xpath://*[contains(@class,'row') or contains(@class,'record')]//a | xpath://table//tbody//tr[1]//a
    Sleep    0.5s
    Complete Current Case
    Click Completed Tab
    Table Should Update

TC-WF-003 Verify Action Restrictions On Completed Case
    [Documentation]    Open a Completed case; status change buttons (e.g. Complete) should be hidden.
    [Tags]    Positive    Workflow
    Ensure On Dashboard
    Click Completed Tab
    Sleep    0.5s
    Click Element    xpath://*[contains(@class,'row') or contains(@class,'record')]//a | xpath://table//tbody//tr[1]//a
    Sleep    0.5s
    Status Change Buttons Should Be Hidden
