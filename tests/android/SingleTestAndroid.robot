*** Settings ***
Library    AppiumLibrary
Library    String
Resource   ../common/KeywordsFile.robot
Test Setup  Open app
Test Teardown   Close app
Library      SeleniumLibrary    run_on_failure=SeleniumLibrary.Capture Page Screenshot

*** Variables ***
${mode}     --headless

*** Test Cases ***
Test Wiki app
    Log To Console    Test
    Launch Browser
    Close Web Browser

*** Keywords ***
Open app
    Open Application    http://127.0.0.1:4723/wd/hub  
    ...  automationName=UIAutomator2
    ...  platformName=Android  
    ...  platformVersion=12.0
    ...  app=apps/smc.apk
    ...  autoWebview=true
    ...  autoGrantPermissions=true
    ...  noReset=false
    ...  newCommandTimeout=450000
    IMPLICIT WAIT    5
    AppiumLibrary.Wait Until Element Is Visible    css=#inputUserName       30s
    AppiumLibrary.Input Text    css=#inputUserName    Krishankumar.mohan@mailinator.com
    AppiumLibrary.Click Element    css=ion-content>div>img


*** Keywords ***
Launch Browser
    SeleniumLibrary.Open Browser
    ...    url=https://www.facebook.com/login/
    ...    browser=chrome
    ...    options=add_argument("${mode}"); add_argument("--no-sandbox"); add_argument('--disable-dev-shm-usage'); add_argument("--ignore-certificate-errors")
    SeleniumLibrary.Maximize Browser Window

Close Web Browser
    SeleniumLibrary.Close Browser