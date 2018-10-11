*** Settings ***
Library           Selenium2Library

*** Keywords ***
Begin Web Test
    Open Browser    about:blank    ${BROWSER}

End Web Browser
    Close Browser

Get Text Count
    ${GetTextCount}=    Get Text    //*[@id="lblLimit"]
    Log    ${GetTextCount}

Do_RESET
    Click Element    //*[@id="buttonreset"]
    Element Should Contain    //*[@id="headinglable"]    Document(s)

Check Disable DocumentTX
    Element Should Not Contain    //*[@id="headinglable"]    Document(s)
    Log    Document Form is Disabled.

Check Disable TextTX
    Element Should Not Contain    //*[@id="textheaderlabel"]    Text
    Log    Text Form is Disabled.

Check Page Reset
    Page Should Contain    Text
    Page Should Contain    Enter text here...
    Page Should Contain    Text translation...
    Element Should Be Visible    xpath=//*[@id="imgClear"]
    Element Should Contain    xpath=//*[@id="lblLimit"]    0/5000
    Page Should Contain    Document(s)
    Click Image    //*[@id="imgSupport"]
