# Quick Start Guide - EPAM Robot Framework Tests

## 🚀 Get Started in 5 Minutes

### Prerequisites
- Python 3.8+ installed
- pip package manager
- Internet connection

### Step 1: Clone Repository (30 seconds)
```bash
git clone https://github.com/jit3pam/elitea_playwright.git
cd elitea_playwright
```

### Step 2: Install Dependencies (2 minutes)
```bash
pip install -r requirements.txt
rfbrowser init
```

### Step 3: Run Tests (1 minute)
```bash
robot tests/
```

### Step 4: View Results (30 seconds)
```bash
# macOS
open report.html

# Linux
xdg-open report.html

# Windows
start report.html
```

---

## 📋 Common Commands

### Run All Tests
```bash
robot tests/
```

### Run Specific Test File
```bash
robot tests/epam_client_work_test.robot
```

### Run Specific Test Case
```bash
robot --name "TC001*" tests/
```

### Run Only Smoke Tests
```bash
robot --include Smoke tests/
```

### Run with Headless Browser (CI/CD)
```bash
robot --variable HEADLESS:True tests/
```

### Run with Debug Output
```bash
robot --loglevel DEBUG tests/
```

### Run with Custom Timeout
```bash
robot --timeout 30s tests/
```

---

## 📊 Test Suite Overview

| Test Case | File | Purpose | Status |
|-----------|------|---------|--------|
| TC001 | epam_client_work_test.robot | Main navigation test | ✅ PASS |
| TC002 | epam_extended_test.robot | Element verification | ✅ PASS |
| TC003 | epam_extended_test.robot | Menu navigation | ✅ PASS |
| TC004 | epam_extended_test.robot | URL validation | ✅ PASS |

---

## 📁 Project Structure

```
project-root/
├── tests/
│   ├── epam_client_work_test.robot        # Main test
│   ├── epam_extended_test.robot           # Extended tests
│   └── README.md                          # Detailed instructions
├── requirements.txt                       # Dependencies
├── robot.cfg                              # Configuration
├── TEST_DOCUMENTATION.md                  # Full documentation
└── QUICK_START.md                         # This file
```

---

## 🔍 Generated Output Files

After running tests, these files are created:
- **report.html** - Summary report ⭐ Open this first
- **log.html** - Detailed logs with screenshots
- **output.xml** - Machine-readable results
- **client_work_verification_*.png** - Evidence screenshots

---

## ⚙️ Troubleshooting

### Problem: Browser not found
```bash
rfbrowser init --force
```

### Problem: Tests fail with timeout
Increase timeout in test file:
```robot
${TIMEOUT}    30s
```

### Problem: Selector not matching
Website may have changed. Update XPath selector in test:
```robot
Click    xpath=//a[contains(text(), 'New Text')]
```

### Problem: Network errors
Check internet connection and verify:
```bash
curl https://www.epam.com/
```

---

## 📚 Need More Help?

- **Setup Issues** → See `tests/README.md`
- **Test Details** → See `TEST_DOCUMENTATION.md`
- **Implementation Info** → See `IMPLEMENTATION_SUMMARY.md`
- **Robot Framework Help** → See https://robotframework.org/

---

## ✨ Key Features

✅ Automated EPAM website testing  
✅ 4 comprehensive test cases  
✅ CI/CD ready (GitHub Actions)  
✅ Detailed reporting  
✅ Screenshot evidence  
✅ Easy to extend  

---

## 🎯 Next Steps

1. ✅ Run tests locally to verify setup
2. ✅ Review test results in report.html
3. ✅ Explore test code in tests/ directory
4. ✅ Add custom tests if needed
5. ✅ Configure branch protection rules
6. ✅ Deploy to CI/CD pipeline

---

**Ready to test?** Run `robot tests/` now! 🚀
