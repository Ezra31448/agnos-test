*** Settings ***
Documentation     ทดสอบการยิง API สร้าง diagnosis record จาก diagnosis_payload.json (ไม่ใช้ browser)
Resource          ${CURDIR}${/}..${/}keywords${/}api.resource

*** Test Cases ***
TC-API-001 Create Diagnosis Via API And Get Id
    [Documentation]    ยิง POST ไปที่ /api/record/diagnosis_records ด้วย payload จากไฟล์ แล้วตรวจว่าได้ diagnosis_record_id คืนมา
    [Tags]    api    diagnosis
    ${diagnosis_id}=    Create Test Data Via API
    Should Not Be Empty    ${diagnosis_id}    msg=API ควร return diagnosis_record_id
    Log To Console    \n diagnosis_record_id = ${diagnosis_id}
    Log    diagnosis_record_id=${diagnosis_id}    level=INFO
