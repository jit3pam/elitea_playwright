*** Settings ***
Documentation     Test suite for EPAM Client Work page verification
Library           Browser
Library           Collections

*** Variables ***
${EPAM_HOME_URL}           https://www.epam.com/
${SERVICES_PAGE_URL}       https://www.epam.com/services
${CLIENT_WORK_URL}         https://www.epam.com/services/client-work
${BROWSER}                 chromium
${HEADLESS}                False

*** Test Cases ***
TC001 - Navigate to EPAM Services and Verify Client Work Page
    [Documentation]    Test scenario to navigate to EPAM website, select Services from header menu,
    ...                click "Explore Our Client Work" link, and verify "Client Work" text is visible
    [Tags]             Navigation    ClientWork    Smoke
    
    # Step 1: Navigate to EPAM homepage
    New Browser        browser=${BROWSER}    headless=${HEADLESS}
    New Page           url=${EPAM_HOME_URL}
    ${page_title}=     Get Title
    Log    Page title: ${page_title}
    
    # Step 2: Navigate to Services page from header menu
    Click              xpath=//a[contains(text(), 'Services')]
    Wait For Load State    networkidle
    ${services_url}=   Get Url
    Log    Services page URL: ${services_url}
    
    # Step 3: Click "Explore Our Client Work" link
    Click              xpath=//a[contains(text(), 'Explore Our Client Work')] | //a[contains(@href, 'client-work')]
    Wait For Load State    networkidle
    ${client_work_url}=    Get Url
    Log    Client Work page URL: ${client_work_url}
    
    # Step 4: Verify "Client Work" text is visible
    Get Text           xpath=//h1[contains(text(), 'Client Work')]    should_be_visible
    
    # Step 5: Additional verifications
    ${page_content}=   Get Text    body
    Should Contain     ${page_content}    Client Work
    Should Contain     ${page_content}    Forbes Global 2000
    
    # Step 6: Capture evidence
    Take Screenshot    filename=client_work_verification_${TIMESTAMP}
    
    [Teardown]         Close Browser


*** Keywords ***
Close Browser
    [Documentation]    Close the browser instance
    Close Page
    Close Browser    ALL
