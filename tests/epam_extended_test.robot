*** Settings ***
Documentation     Extended test suite for EPAM website with multiple scenarios
Library           Browser
Library           Collections
Library           DateTime

*** Variables ***
${EPAM_HOME_URL}           https://www.epam.com/
${BROWSER}                 chromium
${HEADLESS}                False
${TIMEOUT}                 10s

*** Test Cases ***
TC001 - EPAM Client Work Navigation Flow
    [Documentation]    Verify complete navigation from homepage to Client Work page
    [Tags]             Navigation    ClientWork    Smoke    Critical
    Open EPAM Website
    Navigate To Services Page
    Click Explore Client Work Link
    Verify Client Work Page Content
    [Teardown]         Close All Browsers

TC002 - Verify Page Elements on Client Work Page
    [Documentation]    Verify that all expected elements are present on Client Work page
    [Tags]             Verification    ClientWork    UI
    Open EPAM Website
    Navigate To Services Page
    Click Explore Client Work Link
    Verify Client Work Heading Is Visible
    Verify Client Work Description Text Exists
    Verify Page Contains Case Studies
    [Teardown]         Close All Browsers

TC003 - Verify Services Menu Navigation
    [Documentation]    Verify that Services menu is accessible and clickable
    [Tags]             Navigation    Menu    Smoke
    Open EPAM Website
    Verify Services Menu Is Visible
    Click Services Menu
    Verify Services Page Loaded
    [Teardown]         Close All Browsers

TC004 - Client Work Page URL Verification
    [Documentation]    Verify that Client Work page URL is correct
    [Tags]             Navigation    URL    Verification
    Open EPAM Website
    Navigate To Services Page
    Click Explore Client Work Link
    ${current_url}=    Get Url
    Should Contain     ${current_url}    client-work
    Log    Client Work URL verified: ${current_url}
    [Teardown]         Close All Browsers


*** Keywords ***
Open EPAM Website
    [Documentation]    Open EPAM website in the browser
    New Browser        browser=${BROWSER}    headless=${HEADLESS}
    New Page           url=${EPAM_HOME_URL}
    Log    EPAM homepage opened successfully

Navigate To Services Page
    [Documentation]    Navigate to Services page from header menu
    Click              xpath=//a[contains(text(), 'Services')]
    Wait For Load State    networkidle
    Log    Services page navigated successfully

Click Explore Client Work Link
    [Documentation]    Click on "Explore Our Client Work" link
    Click              xpath=//a[contains(text(), 'Explore Our Client Work')] | //a[contains(@href, 'client-work')]
    Wait For Load State    networkidle
    Log    Client Work page link clicked successfully

Verify Client Work Page Content
    [Documentation]    Verify that Client Work page contains expected content
    ${page_content}=   Get Text    body
    Should Contain     ${page_content}    Client Work
    Should Contain     ${page_content}    Forbes Global 2000
    Log    Client Work page content verified

Verify Services Menu Is Visible
    [Documentation]    Verify that Services menu link is visible on the page
    ${services_link}=  Get Element    xpath=//a[contains(text(), 'Services')]
    Should Not Be Empty    ${services_link}
    Log    Services menu is visible

Click Services Menu
    [Documentation]    Click on Services menu
    Click              xpath=//a[contains(text(), 'Services')]
    Wait For Load State    networkidle

Verify Services Page Loaded
    [Documentation]    Verify that Services page loaded successfully
    ${page_content}=   Get Text    body
    Should Contain     ${page_content}    Services
    Log    Services page loaded successfully

Verify Client Work Heading Is Visible
    [Documentation]    Verify that Client Work heading is visible on the page
    ${heading}=        Get Text    xpath=//h1[contains(text(), 'Client Work')]
    Should Not Be Empty    ${heading}
    Log    Client Work heading is visible: ${heading}

Verify Client Work Description Text Exists
    [Documentation]    Verify that Client Work description text exists
    ${description}=    Get Text    xpath=//*[contains(text(), 'Forbes Global')]
    Should Not Be Empty    ${description}
    Log    Client Work description found

Verify Page Contains Case Studies
    [Documentation]    Verify that page contains case studies section
    ${page_content}=   Get Text    body
    Should Contain     ${page_content}    case    ignore_case=True
    Log    Case studies section found on the page

Close All Browsers
    [Documentation]    Close all browser instances
    Close Page
    Close Browser    ALL
    Log    All browsers closed
