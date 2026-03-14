*** Variables ***
# Base URLs (change for different environments)
${BASE_URL}                         https://dev.app.agnoshealth.com
${LANDING_URL}                      ${BASE_URL}/
${HOME_URL}                         ${BASE_URL}/home
${LOGIN_URL}                        ${BASE_URL}/ai_dashboard/login
${SIGN_UP_URL}                      ${BASE_URL}/ai_dashboard/agnos/sign_up
${DASHBOARD_URL}                    ${BASE_URL}/ai_dashboard
${DIAGNOSIS_INFO_ID}                748
${DIAGNOSIS_INFO_URL_748}           ${BASE_URL}/ai_dashboard/diagnosis_info/${DIAGNOSIS_INFO_ID}

# Browser (set CI=true in GitHub Actions for headless)
${BROWSER}                          Chrome
${CI}                               false
${IMPLICIT_WAIT}                    10s
${EXPLICIT_WAIT}                    15s
${SIGNUP_PAGE_WAIT}                 30s

# Test data - Login (from Test Summary)
${LOGIN_EMAIL}                      test@gmail.com
${LOGIN_PASSWORD}                   12345

# Test data - Register
${REG_VALID_EMAIL}                  valid_case@test.com
${REG_VALID_PASSWORD}               Somtum@2026
${REG_INVALID_EMAIL_NO_AT}          testgmail.com
${REG_INVALID_EMAIL_NO_DOMAIN}      test@gmail
${REG_SHORT_PASSWORD}               P@ss1
${REG_NO_UPPERCASE_PASSWORD}        p@ssw0rd1
${REG_NO_DIGIT_PASSWORD}            P@ssword!
${REG_NO_SPECIAL_PASSWORD}          Password123
${REG_MISMATCH_CONFIRM}             Somtum@2025
# Emails for negative tests (valid format, used per test case)
${REG_TEST_EMAIL_TC05}              tc05@gmail.com
${REG_TEST_EMAIL_TC06}              tc06@gmail.com
${REG_TEST_EMAIL_TC07}              tc07@gmail.com
${REG_TEST_EMAIL_TC08}              tc08@gmail.com

${SIGNUP_EMAIL_INPUT}               css:#Email
${SIGNUP_PASSWORD_INPUT}            xpath:(//input[@type='password'])[1]
${SIGNUP_CONFIRM_INPUT}             xpath://div[contains(.,'Confirm Password')]/input[@type='password']
${SIGNUP_CONFIRM_BTN}               xpath://button[contains(.,'Confirm')]
${SIGNUP_PASSWORD_TOGGLE}           xpath:(//input[@type='password'])[1]/..//button

${LOGIN_EMAIL_INPUT}                css:input[type="email"]
${LOGIN_PASSWORD_INPUT}             css:input[type="password"]
${LOGIN_SUBMIT_BTN}                 xpath://button[contains(.,'Sign in') or contains(.,'Sign In') or contains(.,'Login')]
# Landing: div ที่มีข้อความ "วิเคราะห์โรคด้วยตัวเอง" และ "ไม่ต้องต่อคิว..." แล้วกดปุ่ม "เข้าใช้งานแอพพลิเคชั่น" ข้างใน
${LANDING_ENTER_APP_BTN}            xpath://div[contains(.,'วิเคราะห์โรคด้วยตัวเอง') and contains(.,'ไม่ต้องต่อคิว')]//button[contains(.,'เข้าใช้งานแอพพลิเคชั่น')]

${LOGOUT_BTN}                       xpath://button[contains(.,'Log Out')]
${DASHBOARD_SEARCH_INPUT}           css:input[placeholder*="Patient name"]
${DASHBOARD_DIAGNOSIS_LIST}         xpath://*[contains(.,'Diagnosis List')]
${DASHBOARD_SEARCH_BTN}             xpath://button[contains(.,'Search')]
${DASHBOARD_URGENT_FILTER}          xpath://*[contains(.,'Urgent')]/ancestor::label//input[@type="checkbox"]
${DASHBOARD_CHANNEL_DROPDOWN}       css:select[name*="channel"]
${DASHBOARD_TAB_IN_PROGRESS}        xpath://*[contains(.,'In progress')]
${DASHBOARD_TAB_COMPLETED}          xpath://*[contains(.,'Completed')]
${DASHBOARD_TAB_OPEN}               xpath://*[contains(.,'Open')]
${DASHBOARD_DOWNLOAD_BTN}           xpath://button[contains(.,'Download')]
${DASHBOARD_CONFIRM_BTN}            xpath://button[contains(.,'ยืนยัน')]

# Test data - Dashboard (search/filter values)
${DASHBOARD_SEARCH_PATIENT_NAME}    Test
${DASHBOARD_SEARCH_RECORD_ID}       747
${DASHBOARD_FILTER_CHANNEL}         Agnos app
${DASHBOARD_MOVE_IN_PROGRESS}       xpath://button[contains(.,'Move to In-progress')]
${DASHBOARD_COMPLETE_BTN}           xpath://button[contains(.,'Complete')]
${DIAGNOSIS_COPY_ALL_BTN}           xpath://button[contains(.,'คัดลอกทั้งหมด')]
${DIAGNOSIS_NOTE_INPUT}             css:textarea[placeholder*="พิมพ์ข้อความ"]
${DIAGNOSIS_NOTE_SEND_BTN}          xpath://button[contains(.,'ส่ง')]
