*** Settings ***
Resource    ../common.robot
Resource    ../../config/config.robot

*** Keywords ***
Open Diagnosis Info Page
    [Documentation]    Navigates to a specific diagnosis info page (e.g. ID 748).
    [Arguments]    ${diagnosis_id}=748
    Go To    ${BASE_URL}/ai_dashboard/diagnosis_info/${diagnosis_id}
    Wait Until Page Contains Element    ${DIAGNOSIS_COPY_ALL_BTN}    timeout=${EXPLICIT_WAIT}

Copy All Symptoms
    [Documentation]    Clicks the Copy All (คัดลอกทั้งหมด) button in symptoms box.
    Click Element    ${DIAGNOSIS_COPY_ALL_BTN}

Add Note Message
    [Documentation]    Types text in Note input and clicks send.
    [Arguments]    ${note_text}
    Wait Until Element Is Visible    ${DIAGNOSIS_NOTE_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text    ${DIAGNOSIS_NOTE_INPUT}    ${note_text}
    Click Element    ${DIAGNOSIS_NOTE_SEND_BTN}

Note Should Appear In History
    [Documentation]    Verifies note appears in Note message section (with sender and timestamp).
    [Arguments]    ${note_text}
    Wait Until Page Contains    ${note_text}    timeout=${EXPLICIT_WAIT}
    Page Should Contain    ${note_text}
