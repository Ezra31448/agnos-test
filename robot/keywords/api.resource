*** Settings ***
Resource    ${CURDIR}${/}..${/}resources${/}config.resource
Library     RequestsLibrary
Library     OperatingSystem
Library     JSONLibrary

*** Variables ***
# Payload file path (relative to this resource: robot/scripts/)
${DIAGNOSIS_PAYLOAD_PATH}    ${CURDIR}${/}..${/}scripts${/}diagnosis_payload.json

*** Keywords ***
Create Test Data Via API
    [Documentation]    อ่าน payload จาก diagnosis_payload.json แล้ว POST ไปที่ API เพื่อสร้าง diagnosis_record แล้ว return diagnosis_record_id.
    ...    ใช้ config: API_BASE_URL, API_DIAGNOSIS_RECORDS_ENDPOINT, AUTH_TOKEN.
    ${payload}=    Get File    ${DIAGNOSIS_PAYLOAD_PATH}    encoding=UTF-8
    ${headers}=    Create Dictionary
    ...    Authorization=${AUTH_TOKEN}
    ...    Content-Type=application/json
    Create Session    agnos_api    ${API_BASE_URL}
    ${response}=    POST On Session
    ...    agnos_api
    ...    url=${API_DIAGNOSIS_RECORDS_ENDPOINT}
    ...    data=${payload}
    ...    headers=${headers}
    ...    expected_status=any
    IF    ${response.status_code} != 200
        Log    API returned ${response.status_code}: ${response.text}    level=WARN
        FAIL    Create diagnosis via API failed: ${response.status_code} ${response.text}
    END
    ${diagnosis_id}=    Set Variable    ${response.json()}[diagnosis_record_id]
    Log    Create Test Data Via API: diagnosis_record_id=${diagnosis_id}    level=INFO
    RETURN    ${diagnosis_id}

# Capture Diagnosis Id From Requests
#     [Documentation]    (Legacy) ดึง diagnosis_record_id จาก request ที่ดักได้ด้วย SeleniumWire. แนะนำใช้ Create Test Data Via API แทน.
#     ${diagnosis_id}=    Set Variable    ${EMPTY}
#     ${requests}=    Get Requests
#     FOR    ${req}    IN    @{requests}
#         IF    '''${API_DIAGNOSIS_RECORDS_URL}''' in '''${req.url}''' and '''${req.response.body}''' != '''None'''
#             ${json_body}=    Convert String To Json    ${req.response.body}
#             ${ids}=    Get Value From Json    ${json_body}    $.diagnosis_record_id
#             ${len}=    Get Length    ${ids}
#             IF    ${len} > 0
#                 ${diagnosis_id}=    Set Variable    ${ids[0]}
#                 Log To Console    ได้ diagnosis_id คือ: ${diagnosis_id}
#                 BREAK
#             END
#         END
#     END
#     RETURN    ${diagnosis_id}
