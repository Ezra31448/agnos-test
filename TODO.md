# TODO

---

## English

### Context
- Cannot get **Diagnosis ID** from the frontend.
- Must use the **API** to create test data (Diagnosis) and obtain `diagnosis_record_id` for use in tests.

### Tasks

#### 1. Token API (Access + Refresh)
- [ ] Call API to obtain **Access Token** (and Refresh Token if available).
- [ ] Call **Refresh Token** when needed (e.g. when token expires or before expiry).
- [ ] Add related config in `robot/resources/config.resource` (e.g. login/token endpoint, refresh endpoint).
- [ ] Add keywords in `robot/keywords/api.resource` (or a separate resource) for:
  - Get Access Token (from credentials or refresh_token)
  - Refresh Token when necessary

#### 2. Use Token with Create Test Data (Diagnosis) API
- [ ] Use the Access Token from step 1 instead of hardcoded `AUTH_TOKEN` when calling **Create Test Data (Diagnosis)**.
- [ ] Make the `Create Test Data Via API` keyword in `robot/keywords/api.resource` use the token from the real API (not the sample JWT in config).

#### 3. Use Diagnosis ID from API in Dashboard tests
- [ ] Use the **diagnosis_record_id** returned by the Create Test Data API in:
  - **`robot/testcases/dashboard.robot`** — e.g. as Record ID when searching (replacing `DASHBOARD_SEARCH_RECORD_ID` which is currently 747).
  - **`robot/keywords/pages/dashboard.resource`** — if any keyword needs a diagnosis/record ID.
- [ ] (Optional) Use diagnosis_id in **`robot/testcases/diagnosis_info.robot`** / **`robot/keywords/pages/diagnosis_info.resource`**, e.g. open diagnosis info page with the ID created via API.

### Related files
| File | Usage |
|------|--------|
| `robot/resources/config.resource` | BASE_URL, API_BASE_URL, AUTH_TOKEN → will use token from API instead. |
| `robot/keywords/api.resource` | `Create Test Data Via API` — must use token from step 1. |
| `robot/testcases/dashboard.robot` | Use diagnosis/record ID for search, filter, workflow. |
| `robot/keywords/pages/dashboard.resource` | Dashboard keywords; can use record/diagnosis ID if needed. |
| `robot/resources/testdata.resource` | `DASHBOARD_SEARCH_RECORD_ID` — may be set from diagnosis_id from API. |

---

## ภาษาไทย

### บริบทปัญหา
- ทำจากหน้าบ้าน (frontend) **Get Diagnosis ID ไม่ได้**
- ต้องใช้ **API** สร้าง test data (Diagnosis) เพื่อได้ `diagnosis_record_id` ไปใช้ในเทสต่อ

### งานที่ต้องทำต่อ

#### 1. สร้าง API สำหรับ Token (Access + Refresh)
- [ ] ยิง API เพื่อเอา **Access Token** (และ Refresh Token ถ้ามี)
- [ ] ยิง **Refresh Token** เมื่อถึงเวลา (เช่น token หมดอายุ หรือก่อนหมดอายุ)
- [ ] เก็บ config ที่เกี่ยวข้องใน `robot/resources/config.resource` (เช่น endpoint login/token, refresh endpoint)
- [ ] สร้าง keyword ใน `robot/keywords/api.resource` (หรือ resource แยก) สำหรับ:
  - Get Access Token (จาก credentials หรือ refresh_token)
  - Refresh Token เมื่อจำเป็น

#### 2. ใช้ Token กับ API Create Test Data (Diagnosis)
- [ ] ใช้ Access Token จากข้อ 1 แทนค่า `AUTH_TOKEN` (ที่ตอนนี้ hardcode อยู่ใน config) ตอนยิง **Create Test Data (Diagnosis)**
- [ ] ให้ keyword `Create Test Data Via API` ใน `robot/keywords/api.resource` ใช้ token ที่ได้จาก API จริง (ไม่ใช้ JWT ตัวอย่างใน config)

#### 3. ใช้ Diagnosis ID จาก API กับ Dashboard tests
- [ ] เอา **diagnosis_record_id** ที่ได้จาก API Create Test Data ไปใช้ใน:
  - **`robot/testcases/dashboard.robot`** — เช่นใช้เป็น Record ID ตอน search (แทนค่า `DASHBOARD_SEARCH_RECORD_ID` ที่ตอนนี้เป็น 747)
  - **`robot/keywords/pages/dashboard.resource`** — ถ้ามี keyword ที่ต้องใช้ diagnosis/record ID
- [ ] (ถ้าต้องการ) ใช้ diagnosis_id กับ **`robot/testcases/diagnosis_info.robot`** / **`robot/keywords/pages/diagnosis_info.resource`** เช่นเปิดหน้า diagnosis info ด้วย ID ที่สร้างจาก API

### ไฟล์ที่เกี่ยวข้อง
| ไฟล์ | การใช้ |
|------|--------|
| `robot/resources/config.resource` | BASE_URL, API_BASE_URL, AUTH_TOKEN → จะใช้ token จาก API แทน |
| `robot/keywords/api.resource` | `Create Test Data Via API` — ต้องใช้ token จากข้อ 1 |
| `robot/testcases/dashboard.robot` | ใช้ diagnosis/record ID สำหรับ search, filter, workflow |
| `robot/keywords/pages/dashboard.resource` | keyword เกี่ยวกับ dashboard; ใช้ record/diagnosis ID ได้ถ้าต้องการ |
| `robot/resources/testdata.resource` | `DASHBOARD_SEARCH_RECORD_ID` — อาจ set จาก diagnosis_id ที่ได้จาก API |
