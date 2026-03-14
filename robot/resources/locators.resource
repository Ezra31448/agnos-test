*** Variables ***
# Sign-up page
${SIGNUP_EMAIL_INPUT}               css:#Email
${SIGNUP_PASSWORD_INPUT}            xpath:(//input[@type='password'])[1]
${SIGNUP_CONFIRM_INPUT}             xpath://div[contains(.,'Confirm Password')]/input[@type='password']
${SIGNUP_CONFIRM_BTN}               xpath://button[contains(.,'Confirm')]
${SIGNUP_PASSWORD_TOGGLE}           xpath:(//input[@type='password'])[1]/..//button

# Login page
${LOGIN_EMAIL_INPUT}                css:input[type="email"]
${LOGIN_PASSWORD_INPUT}             css:input[type="password"]
${LOGIN_SUBMIT_BTN}                 xpath://button[contains(.,'Sign in') or contains(.,'Sign In') or contains(.,'Login')]

# Landing
${LANDING_ENTER_APP_BTN}            xpath://div[contains(.,'วิเคราะห์โรคด้วยตัวเอง') and contains(.,'ไม่ต้องต่อคิว')]//button[contains(.,'เข้าใช้งานแอพพลิเคชั่น')]

# Agnos app flow
${AGNOS_AI_CARD}                    id=ai-card
${AGNOS_BTN_SELF}                   xpath://button[contains(.,'ตัวเอง')]
${AGNOS_BTN_AGREE}                  xpath://button[contains(.,'รับทราบ')]
${AGNOS_SYMPTOM_INPUT}              xpath://input[contains(@placeholder,'ค้นหาอาการ')]
${AGNOS_SYMPTOM_OPTION_IA}          xpath://button[.//div[normalize-space(.)='ไอ']]
${AGNOS_BTN_NEXT}                   xpath://div[normalize-space(.)='ต่อไป']
${AGNOS_BTN_COUGH_MILD}             xpath://button[.//div[contains(.,'ไอไม่เยอะ นานๆไอที')]]
${AGNOS_BTN_DURATION_WEEK}          xpath://button[.//div[contains(.,'ไม่เกิน 1 สัปดาห์ (ไม่เกิน 7 วัน)')]]
${AGNOS_BTN_COUGH_DRY}              xpath://button[.//div[contains(.,'ไอไม่มีเสมหะ ไอแห้งๆ หรือไอเสมหะสีขาว')]]
${AGNOS_BTN_NONE}                   xpath://button[.//div[normalize-space(.)='ไม่มี']]
${AGNOS_BTN_NO_MUCUS}               xpath://button[.//div[contains(.,'ไม่มีน้ำมูก')]]
${AGNOS_BTN_NONE_OF_ABOVE}          xpath://button[.//div[contains(.,'ไม่มีอาการใดในนี้')]]
${AGNOS_BTN_NO_RED_EYES}            xpath://button[.//div[contains(.,'ไม่มีตาแดง')]]
${AGNOS_BTN_FINISH}                 xpath://div[normalize-space(.)='เสร็จสิ้น']

# Shared / Dashboard
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
${DASHBOARD_MOVE_IN_PROGRESS}       xpath://button[contains(.,'Move to In-progress')]
${DASHBOARD_COMPLETE_BTN}           xpath://button[contains(.,'Complete')]

# Diagnosis info
${DIAGNOSIS_COPY_ALL_BTN}           xpath://button[contains(.,'คัดลอกทั้งหมด')]
${DIAGNOSIS_NOTE_INPUT}             css:textarea[placeholder*="พิมพ์ข้อความ"]
${DIAGNOSIS_NOTE_SEND_BTN}          xpath://button[contains(.,'ส่ง')]
