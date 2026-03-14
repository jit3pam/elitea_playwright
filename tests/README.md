# Robot Framework Tests for EPAM Website

This directory contains Robot Framework test cases for automated testing of the EPAM website.

## Test Cases

### TC001 - Navigate to EPAM Services and Verify Client Work Page
- **File**: `epam_client_work_test.robot`
- **Purpose**: Test navigation flow from EPAM homepage → Services page → Client Work page
- **Tags**: Navigation, ClientWork, Smoke
- **Expected Result**: "Client Work" text should be visible on the Client Work page

#### Test Steps:
1. Navigate to https://www.epam.com/
2. Click "Services" link in the header menu
3. Click "Explore Our Client Work" link
4. Verify "Client Work" text is visible
5. Verify page contains expected content (Forbes Global 2000 reference)
6. Capture evidence screenshot

## Setup and Installation

### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)

### Installation Steps

1. Clone the repository:
```bash
git clone https://github.com/jit3pam/elitea_playwright.git
cd elitea_playwright
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Initialize Browser library:
```bash
rfbrowser init
```

## Running the Tests

### Run all tests in the suite:
```bash
robot tests/epam_client_work_test.robot
```

### Run with headless mode (no visual browser):
```bash
robot --variable HEADLESS:True tests/epam_client_work_test.robot
```

### Run specific test by tag:
```bash
robot --include Smoke tests/epam_client_work_test.robot
```

### Run with detailed output:
```bash
robot --loglevel DEBUG tests/epam_client_work_test.robot
```

## Output Files

After running tests, the following files are generated:
- `output.xml` - Test execution report (machine readable)
- `log.html` - Detailed test log with screenshots
- `report.html` - Test execution summary
- `client_work_verification_*.png` - Evidence screenshots

## Test Execution Report

**Test Status**: ✅ PASS

**Steps Summary**:
| Step | Action | Status |
|------|--------|--------|
| 1 | Navigate to EPAM homepage | ✅ PASS |
| 2 | Click Services in header | ✅ PASS |
| 3 | Click "Explore Our Client Work" | ✅ PASS |
| 4 | Verify "Client Work" text visible | ✅ PASS |
| 5 | Verify page content | ✅ PASS |
| 6 | Capture evidence | ✅ PASS |

**Key Findings**:
- Navigation flow works smoothly
- All expected elements are present
- "Client Work" page contains client case studies and industry information
- Page loads successfully without errors

## Troubleshooting

### Browser fails to open
```bash
# Reinstall browsers
rfbrowser init --force
```

### XPath selectors not matching
- Browser structure may have changed
- Update XPath selectors in test file
- Use Inspector tools to verify current selectors

### Network timeout
- Increase timeout values in test variables
- Check internet connection
- Verify website is accessible

## CI/CD Integration

These tests can be integrated into CI/CD pipelines. Example GitHub Actions workflow:

```yaml
name: Robot Framework Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: '3.10'
      - run: pip install -r requirements.txt
      - run: rfbrowser init
      - run: robot tests/epam_client_work_test.robot
      - uses: actions/upload-artifact@v2
        if: always()
        with:
          name: test-results
          path: |
            log.html
            report.html
```

## Support and Contribution

For issues or contributions, please create an issue or pull request in the repository.

## License

This project is part of the jit3pam/elitea_playwright repository.
