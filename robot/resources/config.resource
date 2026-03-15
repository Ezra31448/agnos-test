*** Variables ***
# Base URLs (change for different environments)
${BASE_URL}                         https://dev.app.agnoshealth.com
${LANDING_URL}                      ${BASE_URL}/
${HOME_URL}                         ${BASE_URL}/home
${LOGIN_URL}                        ${BASE_URL}/ai_dashboard/login
${SIGN_UP_URL}                      ${BASE_URL}/ai_dashboard/agnos/sign_up
${DASHBOARD_URL}                    ${BASE_URL}/ai_dashboard
${API_DIAGNOSIS_RECORDS_URL}        ${BASE_URL}/api/record/diagnosis_records

# API (dev.api host for direct API calls)
${API_BASE_URL}                     https://dev.api.agnoshealth.com
${API_DIAGNOSIS_RECORDS_ENDPOINT}   /api/record/diagnosis_records

# Auth: set AUTH_TOKEN in env to override (e.g. CI). Default dev JWT for local runs.
${AUTH_TOKEN}                       JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.KMUFsIDTnFmyG3nMiGM6H9FNFUROf3wh7SmqJp-QV30

${DIAGNOSIS_INFO_ID}                748
${DIAGNOSIS_INFO_URL_748}           ${BASE_URL}/ai_dashboard/diagnosis_info/${DIAGNOSIS_INFO_ID}

# Browser (set CI=true in GitHub Actions for headless)
${BROWSER}                          Chrome
${CI}                               false
${IMPLICIT_WAIT}                    10s
${EXPLICIT_WAIT}                    15s
${SIGNUP_PAGE_WAIT}                 30s
