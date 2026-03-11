# agnos-test

Robot Framework UI tests for the Agnos Health app (dev.app.agnoshealth.com). Test cases are based on **Test Summary** (see `Test Summary - ชีต1.csv`).

---

## English

### Overview

This project contains automated UI tests for the Agnos Health AI Dashboard. Tests cover **authorization** (login/logout), **registration** (sign-up and validation), **dashboard** (search, filters, export, workflow), and **diagnosis info** (copy symptoms, add notes). The framework uses **Robot Framework** with **SeleniumLibrary** and runs against `https://dev.app.agnoshealth.com`.

### Project structure

```
agnos-test/
├── requirements.txt           # Python dependencies (Robot Framework, SeleniumLibrary, webdriver-manager)
├── robot/
│   ├── config/
│   │   └── config.robot      # URLs, browser, timeouts, test data, locators (CSS/XPath)
│   ├── resources/
│   │   ├── common.robot      # Browser open/close, login helper, validation keywords
│   │   └── pages/            # Page-specific keywords
│   │       ├── sign_up.robot
│   │       ├── login.robot
│   │       ├── dashboard.robot
│   │       └── diagnosis_info.robot
│   ├── tests/                # Test suites (mapped from Test Summary)
│   │   ├── register.robot    # TC-REG-001 .. TC-REG-010
│   │   ├── authorization.robot  # TC-AUTH-001, TC-AUTH-002
│   │   ├── dashboard.robot   # TC-DASH-*, TC-EXP-*, TC-WF-*
│   │   └── diagnosis_info.robot # TC-DET-001, TC-DET-002
│   └── results/              # Optional output directory
```

### How it works

- **Config** (`robot/config/config.robot`): Defines `BASE_URL`, login/sign-up URLs, browser (Chrome), implicit/explicit waits, test data (emails, passwords), and all UI locators (CSS and XPath).
- **Common** (`robot/resources/common.robot`): Uses SeleniumLibrary; provides keywords to open the browser to Login, Sign Up, or Dashboard; close browser; login with valid credentials; ensure on sign-up/dashboard; trigger validation (e.g. Tab/blur); and check for error messages or required-field errors.
- **Pages** (`robot/resources/pages/*.robot`): Each file holds keywords for one screen (e.g. fill form, click button, verify message). They use config variables and common keywords.
- **Tests** (`robot/tests/*.robot`): Each suite has **Suite Setup** (open browser), **Suite Teardown** (close browser), and **Test Teardown** (capture screenshot on failure). Suites that need a logged-in user use **Test Setup** to run `Login With Valid Credentials`.

### Test cases summary

| Suite | Test ID | Description |
|-------|---------|-------------|
| **Authorization** | TC-AUTH-001 | Login with valid credentials; verify redirect to AI Screening Dashboard (Diagnosis List). |
| | TC-AUTH-002 | Login → Logout → verify redirect to login; Back button should not return to dashboard. |
| **Register** | TC-REG-001 | Valid registration; expect redirect to login or dashboard. |
| | TC-REG-002 | Submit with all blank fields; expect required-field errors. |
| | TC-REG-003 | Invalid email formats (no @, no domain); expect format error. |
| | TC-REG-004 | Password &lt; 8 characters; expect length error. |
| | TC-REG-005 | Password without uppercase; expect uppercase error. |
| | TC-REG-006 | Password without digit; expect digit error. |
| | TC-REG-007 | Password without special character; expect special-char error. |
| | TC-REG-008 | Confirm password mismatch; expect match error. |
| | TC-REG-009 | Password visibility toggle; after two toggles, password remains masked. |
| | TC-REG-010 | Register with already-registered email; expect “already in use” (or similar) message. |
| **Dashboard** | TC-DASH-001 | Search by patient name; table updates. |
| | TC-DASH-002 | Search by record ID; table shows the record. |
| | TC-DASH-003 | Filter by Urgent triage; table filters. |
| | TC-DASH-004 | Filter by date (calendar); table filters. |
| | TC-DASH-005 | Filter by channel (e.g. Agnos app); table filters. |
| | TC-DASH-006 | Navigate In progress / Completed / Open tabs; view switches. |
| | TC-EXP-001 | Download filtered records (Download → confirm); file download. |
| | TC-WF-001 | Move case from Open to In progress; record moves. |
| | TC-WF-002 | Complete a case from In progress; record moves to Completed. |
| | TC-WF-003 | Open a Completed case; status-change buttons (e.g. Complete) are hidden. |
| **Diagnosis info** | TC-DET-001 | Copy all symptoms (Copy All button); clipboard (manual check). |
| | TC-DET-002 | Add a note; note appears in history with text. |

### Prerequisites

- Python 3.8+
- Chrome (or set `BROWSER` in `robot/config/config.robot` to `Firefox` etc.)

### Setup

```bash
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### Run tests

From project root (with venv activated):

```bash
# Run all suites
robot robot/tests/

# Run a single suite
robot robot/tests/register.robot
robot robot/tests/authorization.robot
robot robot/tests/dashboard.robot
robot robot/tests/diagnosis_info.robot

# Run by tag (e.g. Smoke only)
robot --include Smoke robot/tests/

# Run by tag (Regression)
robot --include Regression robot/tests/

# Output to robot/results/
robot --outputdir robot/results robot/tests/
```

After execution, open `report.html` or `log.html` for results.

### GitHub Actions

Tests run on **push** and **pull_request** to `main`/`master` (`.github/workflows/robot-tests.yml`). The workflow uses headless Chrome, pip cache, and concurrency (new runs cancel previous ones on the same branch). Results are uploaded as artifact `robot-results` (report.html, log.html; 7 days). To run headless locally: `robot --variable CI:true --outputdir robot/results robot/tests/`.

### Configuration

- **URLs and browser:** `robot/config/config.robot` — change `BASE_URL`, `BROWSER`, timeouts.
- **Locators:** Same file; adjust selectors if the app markup changes.
- **Test data:** Login/register credentials and test emails are in `config.robot`.

### Tags

- **Positive** / **Negative** — scenario type  
- **Smoke** / **Regression** — run subset  
- **Filter**, **Export**, **Workflow** — dashboard feature

Examples: `robot --include Smoke robot/tests/` | `robot --exclude Negative robot/tests/`

---

## ภาษาไทย

### ภาพรวม

โปรเจคนี้เป็นเทส UI อัตโนมัติสำหรับ Agnos Health AI Dashboard ครอบคลุม **การยืนยันตัวตน** (ล็อกอิน/ล็อกเอาท์), **การลงทะเบียน** (สมัครสมาชิกและ validation), **แดชบอร์ด** (ค้นหา, ตัวกรอง, ส่งออก, workflow), และ **ข้อมูลการวินิจฉัย** (คัดลอกอาการ, เพิ่มโน้ต) ใช้ **Robot Framework** กับ **SeleniumLibrary** รันกับ `https://dev.app.agnoshealth.com`

### โครงสร้างโปรเจค

```
agnos-test/
├── requirements.txt           # Dependencies (Robot Framework, SeleniumLibrary, webdriver-manager)
├── robot/
│   ├── config/
│   │   └── config.robot      # URL, browser, timeouts, ข้อมูลทดสอบ, locators (CSS/XPath)
│   ├── resources/
│   │   ├── common.robot      # เปิด/ปิด browser, login, keywords สำหรับ validation
│   │   └── pages/            # keywords แยกตามหน้า
│   │       ├── sign_up.robot
│   │       ├── login.robot
│   │       ├── dashboard.robot
│   │       └── diagnosis_info.robot
│   ├── tests/                # ชุดเทส (ตาม Test Summary)
│   │   ├── register.robot    # TC-REG-001 .. TC-REG-010
│   │   ├── authorization.robot  # TC-AUTH-001, TC-AUTH-002
│   │   ├── dashboard.robot   # TC-DASH-*, TC-EXP-*, TC-WF-*
│   │   └── diagnosis_info.robot # TC-DET-001, TC-DET-002
│   └── results/              # โฟลเดอร์สำหรับ output (ถ้าต้องการ)
```

### การทำงานโดยรวม

- **Config** (`robot/config/config.robot`): กำหนด BASE_URL, URL ล็อกอิน/สมัครสมาชิก, browser (Chrome), เวลารอ, ข้อมูลทดสอบ (อีเมล/รหัสผ่าน), และ locators ของ UI (CSS และ XPath)
- **Common** (`robot/resources/common.robot`): ใช้ SeleniumLibrary มี keywords สำหรับเปิด browser ไปหน้า Login / Sign Up / Dashboard, ปิด browser, ล็อกอินด้วย credentials ที่ถูกต้อง, ตรวจสอบว่าอยู่หน้ากำหนด, trigger validation (เช่น Tab/blur), และตรวจข้อความ error หรือ required
- **Pages** (`robot/resources/pages/*.robot`): แต่ละไฟล์เก็บ keywords ของหน้ามัน (กรอกฟอร์ม, กดปุ่ม, ตรวจข้อความ) ใช้ตัวแปรจาก config และ keywords จาก common
- **Tests** (`robot/tests/*.robot`): แต่ละ suite มี Suite Setup (เปิด browser), Suite Teardown (ปิด browser), Test Teardown (ถ้าเทสล้มจะถ่าย screenshot) บาง suite ใช้ Test Setup เรียก `Login With Valid Credentials` เพื่อให้เทสรันหลังล็อกอินแล้ว

### สรุปเทสเคส

| ชุดเทส | รหัสเทส | รายละเอียด |
|--------|---------|-------------|
| **Authorization** | TC-AUTH-001 | ล็อกอินด้วย credentials ที่ถูกต้อง ตรวจว่าไปหน้า AI Screening Dashboard (Diagnosis List) |
| | TC-AUTH-002 | ล็อกอิน → ล็อกเอาท์ → ตรวจว่า redirect ไปหน้า login กด Back แล้วไม่กลับเข้า dashboard |
| **Register** | TC-REG-001 | สมัครด้วยข้อมูลถูกต้อง คาดว่า redirect ไป login หรือ dashboard |
| | TC-REG-002 | ส่งฟอร์มโดยไม่กรอกอะไร คาดว่าแสดง error ช่องบังคับ |
| | TC-REG-003 | อีเมลรูปแบบผิด (ไม่มี @, ไม่มี domain) คาดว่าแสดง error รูปแบบอีเมล |
| | TC-REG-004 | รหัสผ่านน้อยกว่า 8 ตัว คาดว่าแสดง error ความยาว |
| | TC-REG-005 | รหัสผ่านไม่มีตัวพิมพ์ใหญ่ คาดว่าแสดง error เรื่อง uppercase |
| | TC-REG-006 | รหัสผ่านไม่มีตัวเลข คาดว่าแสดง error เรื่อง digit |
| | TC-REG-007 | รหัสผ่านไม่มีอักขระพิเศษ คาดว่าแสดง error เรื่อง special |
| | TC-REG-008 | ยืนยันรหัสผ่านไม่ตรงกับรหัสผ่าน คาดว่าแสดง error เรื่อง match |
| | TC-REG-009 | สลับการแสดงรหัสผ่าน (toggle) สองครั้ง คาดว่ารหัสผ่านยังเป็นแบบ masked |
| | TC-REG-010 | สมัครด้วยอีเมลที่ใช้แล้ว คาดว่าแสดงข้อความแบบ already in use |
| **Dashboard** | TC-DASH-001 | ค้นหาด้วยชื่อคนไข้ ตารางอัปเดต |
| | TC-DASH-002 | ค้นหาด้วย Record ID ตารางแสดงรายการนั้น |
| | TC-DASH-003 | กรองด้วย Urgent ตารางกรองตาม triage |
| | TC-DASH-004 | กรองตามวันที่ (ปฏิทิน) ตารางกรอง |
| | TC-DASH-005 | กรองตาม channel (เช่น Agnos app) ตารางกรอง |
| | TC-DASH-006 | สลับแท็บ In progress / Completed / Open มุมมองเปลี่ยนตามแท็บ |
| | TC-EXP-001 | ดาวน์โหลดรายการที่กรอง (Download → ยืนยัน) ได้ไฟล์ |
| | TC-WF-001 | ย้ายเคสจาก Open ไป In progress รายการย้ายไปแท็บ In progress |
| | TC-WF-002 | Complete เคสจาก In progress รายการย้ายไปแท็บ Completed |
| | TC-WF-003 | เปิดเคสที่ Completed ปุ่มเปลี่ยนสถานะ (เช่น Complete) ต้องไม่แสดง |
| **Diagnosis info** | TC-DET-001 | กดคัดลอกทั้งหมด (อาการ) ตรวจ clipboard (ตรวจเอง) |
| | TC-DET-002 | เพิ่มโน้ต โน้ตปรากฏในประวัติพร้อมข้อความ |

### สิ่งที่ต้องมีก่อนรัน

- Python 3.8+
- Chrome (หรือตั้ง `BROWSER` ใน `robot/config/config.robot` เป็น `Firefox` ฯลฯ)

### การติดตั้ง

```bash
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### การรันเทส

รันจาก root โปรเจค (หลัง activate venv):

```bash
# รันทุก suite
robot robot/tests/

# รัน suite เดียว
robot robot/tests/register.robot
robot robot/tests/authorization.robot
robot robot/tests/dashboard.robot
robot robot/tests/diagnosis_info.robot

# รันตาม tag (เช่น Smoke เท่านั้น)
robot --include Smoke robot/tests/

# รันตาม tag (Regression)
robot --include Regression robot/tests/

# ส่ง output ไป robot/results/
robot --outputdir robot/results robot/tests/
```

หลังรัน เปิด `report.html` หรือ `log.html` เพื่อดูผล

### GitHub Actions

เทสรันเมื่อ **push** หรือ **pull_request** ไปที่ `main`/`master` (ไฟล์ `.github/workflows/robot-tests.yml`) ใช้ Chrome แบบ headless, pip cache และ concurrency (รันใหม่จะยกเลิกรันเก่าบน branch เดิม) ผลเทสอัปโหลดเป็น artifact ชื่อ `robot-results` (report.html, log.html เก็บ 7 วัน) รันแบบ headless ในเครื่อง: `robot --variable CI:true --outputdir robot/results robot/tests/`

### การตั้งค่า

- **URL และ browser:** แก้ใน `robot/config/config.robot` — `BASE_URL`, `BROWSER`, timeouts
- **Locators:** ไฟล์เดียวกัน แก้ selectors ถ้า markup แอปเปลี่ยน
- **ข้อมูลทดสอบ:** อีเมล/รหัสผ่านสำหรับล็อกอินและสมัครอยู่ใน `config.robot`

### Tags

- **Positive** / **Negative** — ประเภทสถานการณ์  
- **Smoke** / **Regression** — รันเทสย่อย  
- **Filter**, **Export**, **Workflow** — ฟีเจอร์แดชบอร์ด  

ตัวอย่าง: `robot --include Smoke robot/tests/` | `robot --exclude Negative robot/tests/`
