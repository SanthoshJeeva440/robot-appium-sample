*** Settings ***
Library    AppiumLibrary
Library    String
Resource   ../common/KeywordsFile.robot
Library      SeleniumLibrary    run_on_failure=SeleniumLibrary.Capture Page Screenshot

*** Variables ***
&{capabilities}     browser=chrome
${test_url}     https://bstackdemo.com

*** Test Cases ***
Test web
    Log To Console    Test
#    Launch Browser
#    Close Web Browser

#Test Mob
#    Open app
#    Close app


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
    SeleniumLibrary.open browser    remote_url=http://localhost:4444/wd/hub    browser=chrome    desired_capabilities=${capabilities}   url=${test_url}
    SeleniumLibrary.Maximize Browser Window

Close Web Browser
    SeleniumLibrary.Close Browser