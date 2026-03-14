*** Variables ***
# Test data - Login
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
${REG_TEST_EMAIL_TC05}              tc05@gmail.com
${REG_TEST_EMAIL_TC06}              tc06@gmail.com
${REG_TEST_EMAIL_TC07}              tc07@gmail.com
${REG_TEST_EMAIL_TC08}              tc08@gmail.com

# Test data - Dashboard (search/filter values)
${DASHBOARD_SEARCH_PATIENT_NAME}    Test
${DASHBOARD_SEARCH_RECORD_ID}       747
${DASHBOARD_FILTER_CHANNEL}         Agnos app

# Test data - Agnos app (symptom input value)
${AGNOS_SYMPTOM_INPUT_VALUE}        ไอ
