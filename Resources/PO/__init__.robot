*** Keywords ***
R_TX_ZHEN
    [Tags]    EN-ZH
    Select From List By Label    id=selEngine    English to Simplified Chinese (Patents and Legal)
    Click Element    id=txtText
    Input Text    id=txtText    this is a test text.
    ${box text}=    Get Text    //*[@id="lblLimit"]
    Should Be Equal    20/5000    ${box text}
    Click Element    id=btnTranslate
    Sleep    3s
    Textarea Value Should Be    id=txtTranslation    \u8FD9\u662F\u4E00\u4E2A\u6D4B\u8BD5\u6587\u672C\u3002

R_TX_ENZH
    [Tags]    ZH-EN
    Select From List By Label    id=selEngine    Simplified Chinese to English (Patents and Legal)
    Click Element    id=txtText
    Input Text    id=txtText    这是一个测试文本。
    ${box text}=    Get Text    //*[@id="lblLimit"]
    Should Be Equal    9/5000    ${box text}
    Click Element    id=btnTranslate
    Sleep    3s
    Textarea Value Should Be    id=txtTranslation    This is a test text.

Do_Reset
    Click Element    id=buttonreset

EN_Mode
    Select From List    id=PageLangSelect    English
    Click Element    xpath=//option[@value='en']
