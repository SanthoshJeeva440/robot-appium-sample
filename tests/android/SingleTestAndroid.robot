*** Settings ***
Library    AppiumLibrary
Library    String
Resource   ../common/KeywordsFile.robot
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***
Test Wiki app
#    Search for keyword browserstack in wiki app
#    Validate search test
    Log To Console    Test

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
#    AppiumLibrary.Input Text    css=#inputPassword   Testing0001#
#    AppiumLibrary.Click Element    css=ion-content>div>img
#    AppiumLibrary.Click Element    css=#ion_button_login