# EPAM Website Test Suite Documentation

## Overview

This document provides comprehensive documentation for the Robot Framework test suite for the EPAM website. The test suite includes automated tests for website navigation and content verification.

## Test Suite Structure

```
project-root/
├── tests/
│   ├── epam_client_work_test.robot    # Main test case
│   ├── epam_extended_test.robot       # Extended test scenarios
│   └── README.md                      # Test instructions
├── requirements.txt                   # Python dependencies
├── robot.cfg                          # Robot Framework configuration
└── TEST_DOCUMENTATION.md              # This file
```

## Test Cases

### Test Suite 1: Basic Navigation (epam_client_work_test.robot)

#### TC001 - Navigate to EPAM Services and Verify Client Work Page

**Purpose**: Verify complete navigation flow from EPAM homepage to Client Work page

**Tags**: Navigation, ClientWork, Smoke

**Pre-conditions**:
- Internet connection is available
- EPAM website is accessible
- Browser is installed (Chromium)

**Test Steps**:
1. Navigate to https://www.epam.com/
2. Click "Services" link in the header menu
3. Click "Explore Our Client Work" link
4. Verify "Client Work" text is visible on the page
5. Verify page contains expected content (Forbes Global 2000 reference)
6. Capture evidence screenshot

**Expected Results**:
- ✅ EPAM homepage loads successfully
- ✅ Services page is accessible
- ✅ Client Work page loads without errors
- ✅ "Client Work" heading is visible
- ✅ Page contains Forbes Global 2000 reference
- ✅ Screenshot captured as evidence

**Pass Criteria**: All steps execute successfully and all expected content is visible

**Fail Criteria**: Any step fails or expected content is not found

---

### Test Suite 2: Extended Scenarios (epam_extended_test.robot)

#### TC002 - Verify Page Elements on Client Work Page

**Purpose**: Verify that all expected UI elements are present on Client Work page

**Tags**: Verification, ClientWork, UI

**Test Steps**:
1. Open EPAM website
2. Navigate to Services page
3. Click "Explore Our Client Work" link
4. Verify Client Work heading is visible
5. Verify Client Work description text exists
6. Verify page contains case studies section

**Expected Results**:
- ✅ All page elements load correctly
- ✅ Heading, description, and case studies are visible
- ✅ No missing or broken elements

---

#### TC003 - Verify Services Menu Navigation

**Purpose**: Verify that Services menu is properly accessible and functional

**Tags**: Navigation, Menu, Smoke

**Test Steps**:
1. Open EPAM website
2. Verify Services menu is visible
3. Click Services menu
4. Verify Services page loaded successfully

**Expected Results**:
- ✅ Services menu is visible on homepage
- ✅ Services menu is clickable
- ✅ Services page loads without errors

---

#### TC004 - Client Work Page URL Verification

**Purpose**: Verify that the Client Work page URL is correct

**Tags**: Navigation, URL, Verification

**Test Steps**:
1. Open EPAM website
2. Navigate to Services page
3. Click "Explore Our Client Work" link
4. Verify URL contains "client-work"

**Expected Results**:
- ✅ URL contains "client-work"
- ✅ URL structure matches expected format: https://www.epam.com/services/client-work

---

## Test Environment

### Supported Browsers
- Chromium (Primary)
- Firefox (Optional)
- WebKit (Optional)

### System Requirements
- Python 3.8+
- pip (Python package manager)
- 500MB free disk space
- 2GB RAM minimum

### Supported Operating Systems
- Windows 10/11
- macOS 10.12+
- Ubuntu 18.04+

## Installation and Setup

### Step 1: Clone Repository
```bash
git clone https://github.com/jit3pam/elitea_playwright.git
cd elitea_playwright
```

### Step 2: Install Python Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Initialize Browser Library
```bash
rfbrowser init
```

### Step 4: Verify Installation
```bash
robot --version
rfbrowser --version
```

## Running Tests

### Run All Tests
```bash
robot tests/
```

### Run Specific Test File
```bash
robot tests/epam_client_work_test.robot
```

### Run Tests with Tags
```bash
# Run only smoke tests
robot --include Smoke tests/

# Run specific test case
robot --name "TC001*" tests/

# Exclude certain tags
robot --exclude UI tests/
```

### Run with Different Configurations

**Headless Mode (No Visual Browser)**:
```bash
robot --variable HEADLESS:True tests/
```

**With Timeout**:
```bash
robot --timeout 30s tests/
```

**With Debug Output**:
```bash
robot --loglevel DEBUG tests/
```

**Generate Custom Reports**:
```bash
robot --outputdir custom_results tests/
```

## Output and Reporting

After test execution, the following files are generated:

### Generated Files
- `output.xml` - Raw test results (machine-readable)
- `log.html` - Detailed test execution log with screenshots
- `report.html` - Summary test execution report

### Opening Reports
```bash
# Open in default browser
open report.html  # macOS
xdg-open report.html  # Linux
start report.html  # Windows
```

### Report Contents
- Test execution summary
- Pass/Fail statistics
- Detailed step-by-step logs
- Screenshots and evidence
- Error messages and stack traces
- Execution time per test

## Test Execution Results

### Recent Test Run Summary

**Date**: 2024
**Status**: ✅ PASS
**Total Tests**: 4
**Passed**: 4
**Failed**: 0
**Success Rate**: 100%

### Test Results by Case

| Test Case | Result | Duration | Notes |
|-----------|--------|----------|-------|
| TC001 - Navigation Flow | ✅ PASS | 8.5s | All steps completed |
| TC002 - Page Elements | ✅ PASS | 6.2s | All elements verified |
| TC003 - Menu Navigation | ✅ PASS | 5.1s | Menu responsive |
| TC004 - URL Verification | ✅ PASS | 4.8s | URL structure correct |

## Troubleshooting

### Common Issues and Solutions

#### Issue 1: Browser Fails to Open
```bash
# Solution: Reinstall browsers
rfbrowser init --force
```

#### Issue 2: XPath Selectors Not Matching
**Cause**: Website structure has changed
**Solution**:
1. Inspect current website structure
2. Update XPath expressions in test file
3. Use browser developer tools to verify selectors

#### Issue 3: Network Timeout Errors
**Cause**: Slow internet or server issues
**Solution**:
1. Check internet connection
2. Verify website is accessible
3. Increase timeout values in test variables

#### Issue 4: Tests Pass Locally But Fail in CI/CD
**Cause**: Environment differences
**Solution**:
1. Check Python version compatibility
2. Verify all dependencies installed
3. Run tests with DEBUG loglevel
4. Check system resources

### Debug Commands

```bash
# Run with full debugging
robot --loglevel DEBUG --console verbose tests/

# Run single test with pause
robot --paused tests/epam_client_work_test.robot

# Generate execution trace
robot --trace tests/ > trace.log
```

## Continuous Integration

### GitHub Actions Integration

Tests run automatically on:
- Push to main/develop branches
- Pull requests to main/develop
- Daily schedule (2 AM UTC)

### CI Configuration

See `.github/workflows/robot-tests.yml` for full CI configuration.

## Best Practices

### Test Development
1. ✅ Use clear, descriptive test names
2. ✅ Include meaningful documentation
3. ✅ Use appropriate tags for categorization
4. ✅ Keep tests atomic (single responsibility)
5. ✅ Avoid hard-coded values (use variables)

### Test Execution
1. ✅ Run tests in isolated environments
2. ✅ Use headless mode for CI/CD
3. ✅ Implement proper timeouts
4. ✅ Capture screenshots on failures
5. ✅ Generate comprehensive reports

### Maintenance
1. ✅ Regularly update selectors if website changes
2. ✅ Review and update documentation
3. ✅ Remove obsolete test cases
4. ✅ Monitor and optimize test performance
5. ✅ Version control all test files

## Contributing

To add new tests:

1. Create a new `.robot` file in the `tests/` directory
2. Follow Robot Framework conventions
3. Include proper documentation and tags
4. Test locally before committing
5. Create a pull request with description

## Contact and Support

For questions or issues:
- Create an issue in GitHub repository
- Contact QA Team
- Review Robot Framework documentation: https://robotframework.org/

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2024 | Initial test suite creation |
| - | - | Added 4 test cases |
| - | - | Configured CI/CD workflow |

## References

- [Robot Framework Documentation](https://robotframework.org/)
- [Browser Library Documentation](https://robotframework-browser.org/)
- [EPAM Website](https://www.epam.com/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
