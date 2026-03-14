*** Settings ***
Resource    ${CURDIR}${/}..${/}common.resource
Resource    ${CURDIR}${/}..${/}api.resource

*** Keywords ***
Login With Valid Credentials
    [Documentation]    ไปที่ landing → กด "เข้าใช้งานแอพพลิเคชั่น" → รอ /home → ไปหน้า ai_dashboard/login แล้วกรอกอีเมล/รหัสผ่าน. (Location ถูกบล็อก via browser options ใน Suite Setup)
    [Arguments]    ${email}=${LOGIN_EMAIL}    ${password}=${LOGIN_PASSWORD}
    Go To    ${LANDING_URL}
    Wait Until Element Is Visible    ${LANDING_ENTER_APP_BTN}    timeout=${EXPLICIT_WAIT}
    Click Element    ${LANDING_ENTER_APP_BTN}
    Wait Until Location Contains    /home    timeout=${EXPLICIT_WAIT}
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    ${LOGIN_EMAIL_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text    ${LOGIN_EMAIL_INPUT}    ${email}
    Input Password    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT_BTN}
    Wait Until Location Contains    ai_dashboard    timeout=${EXPLICIT_WAIT}
    Go To    ${LANDING_URL}
    Wait Until Location Contains    /home    timeout=${EXPLICIT_WAIT}

Create Test Data
    [Documentation]    สร้าง test data ผ่านโฟลว์ AI แล้ว return diagnosis_id จาก API response (ดักจาก request หลังกดเสร็จสิ้น). ใช้ SeleniumWireLibrary เพื่อดักจับ request.
    Wait Until Element Is Visible    ${AGNOS_AI_CARD}    timeout=${EXPLICIT_WAIT}
    Execute JavaScript    document.getElementById('ai-card').click()
    Click Self Assessment Button
    Click Agree Button
    Wait Until Element Is Visible    ${AGNOS_SYMPTOM_INPUT}    timeout=${EXPLICIT_WAIT}
    Input Text       ${AGNOS_SYMPTOM_INPUT}    ${AGNOS_SYMPTOM_INPUT_VALUE}
    Wait Until Element Is Visible    ${AGNOS_SYMPTOM_OPTION_IA}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_SYMPTOM_OPTION_IA}
    Click Next Button
    Click Cough Mild Option
    Click Duration Within Week
    Click Cough Dry Option
    Click None Option
    Click No Mucus Option
    Click None Of Above Option
    Click No Red Eyes Option
    Click None Of Above Option
    Click None Of Above Option
    Click None Of Above Option
    Click None Of Above Option
    Click None Of Above Option
    Click None Of Above Option
    Click None Of Above Option
    Click Finish Button
    Sleep    3s
    ${diagnosis_id}=    Capture Diagnosis Id From Requests
    RETURN    ${diagnosis_id}

Click Self Assessment Button
    [Documentation]    คลิกปุ่ม "ตัวเอง"
    Wait Until Element Is Visible    ${AGNOS_BTN_SELF}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_SELF}

Click Agree Button
    [Documentation]    คลิกปุ่ม "รับทราบ"
    Wait Until Element Is Visible    ${AGNOS_BTN_AGREE}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_AGREE}

Click Duration Within Week
    [Documentation]    คลิกปุ่มตัวเลือก "ไม่เกิน 1 สัปดาห์ (ไม่เกิน 7 วัน)"
    Wait Until Element Is Visible    ${AGNOS_BTN_DURATION_WEEK}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_DURATION_WEEK}

Click Cough Dry Option
    [Documentation]    คลิกปุ่มตัวเลือก "ไอไม่มีเสมหะ ไอแห้งๆ หรือไอเสมหะสีขาว"
    Wait Until Element Is Visible    ${AGNOS_BTN_COUGH_DRY}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_COUGH_DRY}

Click No Mucus Option
    [Documentation]    คลิกปุ่มตัวเลือกที่มีคำว่า "ไม่มีน้ำมูก" (ใช้ contains)
    Wait Until Element Is Visible    ${AGNOS_BTN_NO_MUCUS}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_NO_MUCUS}

Click None Of Above Option
    [Documentation]    คลิกปุ่มตัวเลือก "ไม่มีอาการใดในนี้"
    Wait Until Element Is Visible    ${AGNOS_BTN_NONE_OF_ABOVE}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_NONE_OF_ABOVE}
    Wait Until Element Is Visible    ${AGNOS_BTN_NEXT}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_NEXT}

Click No Red Eyes Option
    [Documentation]    คลิกปุ่มตัวเลือก "ไม่มีตาแดง"
    Wait Until Element Is Visible    ${AGNOS_BTN_NO_RED_EYES}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_NO_RED_EYES}

Click Finish Button
    [Documentation]    คลิกปุ่ม "เสร็จสิ้น"
    Wait Until Element Is Visible    ${AGNOS_BTN_FINISH}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_FINISH}

Click Next Button
    [Documentation]    คลิกปุ่ม "ต่อไป" (div ที่มีข้อความ ต่อไป)
    Wait Until Element Is Visible    ${AGNOS_BTN_NEXT}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_NEXT}

Click Cough Mild Option
    [Documentation]    คลิกปุ่มตัวเลือก "ไอไม่เยอะ นานๆไอที"
    Wait Until Element Is Visible    ${AGNOS_BTN_COUGH_MILD}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_COUGH_MILD}

Click None Option
    [Documentation]    คลิกปุ่มตัวเลือก "ไม่มี"
    Wait Until Element Is Visible    ${AGNOS_BTN_NONE}    timeout=${EXPLICIT_WAIT}
    Click Element    ${AGNOS_BTN_NONE}
