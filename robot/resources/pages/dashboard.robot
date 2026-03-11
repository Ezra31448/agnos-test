*** Settings ***
Resource    ../common.robot
Resource    ../../config/config.robot

*** Keywords ***
Search By Patient Name
    [Documentation]    Types patient name in search bar and clicks Search.
    [Arguments]    ${patient_name}
    Wait Until Element Is Visible    ${DASHBOARD_SEARCH_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text    ${DASHBOARD_SEARCH_INPUT}    ${patient_name}
    Click Element    ${DASHBOARD_SEARCH_BTN}

Search By Record ID
    [Documentation]    Types record ID in search bar and clicks Search.
    [Arguments]    ${record_id}
    Wait Until Element Is Visible    ${DASHBOARD_SEARCH_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text    ${DASHBOARD_SEARCH_INPUT}    ${record_id}
    Click Element    ${DASHBOARD_SEARCH_BTN}

Filter By Urgent Triage
    [Documentation]    Checks the Urgent checkbox filter (uncheck others if needed).
    Wait Until Element Is Visible    ${DASHBOARD_URGENT_FILTER}    timeout=${EXPLICIT_WAIT}
    Select Checkbox    ${DASHBOARD_URGENT_FILTER}

Filter By Channel
    [Documentation]    Selects a channel from the Channel dropdown (e.g. Agnos app).
    [Arguments]    ${channel_value}
    Wait Until Element Is Visible    ${DASHBOARD_CHANNEL_DROPDOWN}    timeout=${EXPLICIT_WAIT}
    Select From List By Label    ${DASHBOARD_CHANNEL_DROPDOWN}    ${channel_value}

Click In Progress Tab
    [Documentation]    Switches to In progress tab.
    Click Element    ${DASHBOARD_TAB_IN_PROGRESS}

Click Completed Tab
    [Documentation]    Switches to Completed tab.
    Click Element    ${DASHBOARD_TAB_COMPLETED}

Click Open Tab
    [Documentation]    Switches to Open tab.
    Click Element    ${DASHBOARD_TAB_OPEN}

Navigate Status Tabs
    [Documentation]    Clicks In progress, Completed, and Open tabs in sequence.
    Click In Progress Tab
    Sleep    0.5s
    Click Completed Tab
    Sleep    0.5s
    Click Open Tab

Download Filtered Records
    [Documentation]    Clicks Download then ยืนยัน to download file.
    Click Element    ${DASHBOARD_DOWNLOAD_BTN}
    Wait Until Element Is Visible    ${DASHBOARD_CONFIRM_BTN}    timeout=${EXPLICIT_WAIT}
    Click Element    ${DASHBOARD_CONFIRM_BTN}

Move First Open Case To In Progress
    [Documentation]    Clicks Move to In-progress for a record then ยืนยัน.
    Click Element    ${DASHBOARD_MOVE_IN_PROGRESS}
    Wait Until Element Is Visible    ${DASHBOARD_CONFIRM_BTN}    timeout=${EXPLICIT_WAIT}
    Click Element    ${DASHBOARD_CONFIRM_BTN}

Complete Current Case
    [Documentation]    Clicks Complete button then ยืนยัน.
    Click Element    ${DASHBOARD_COMPLETE_BTN}
    Wait Until Element Is Visible    ${DASHBOARD_CONFIRM_BTN}    timeout=${EXPLICIT_WAIT}
    Click Element    ${DASHBOARD_CONFIRM_BTN}

Status Change Buttons Should Be Hidden
    [Documentation]    Verifies Complete (or similar) button is not visible on completed case.
    Element Should Not Be Visible    ${DASHBOARD_COMPLETE_BTN}

Table Should Update
    [Documentation]    Placeholder: table has updated (e.g. after search/filter). Can add explicit checks later.
    Sleep    0.5s
