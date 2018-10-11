*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Resource          Translation.robot

*** Keywords ***
Download_TX_File
    sleep    5s
    Click Element    //*[@id="tr4"]/td[6]/a
    sleep    5s
    Capture Page Screenshot

Deleting_Job
    EN_BATCH_MSWord_Double
    Click Element    //*[@id="tr4"]/td[7]/img
    sleep    5s
    Element Should Not Be Visible    //*[@id="tr4"]/td[6]/a
    Element Should Contain    //*[@id="tr8"]/td[6]/a    Complete
    Log    Translated Job has been Deleted.
    Capture Page Screenshot
