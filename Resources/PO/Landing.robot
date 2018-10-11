*** Settings ***
Library           Selenium2Library
Library           XML
Library           AutoItLibrary

*** Keywords ***
Load
    Go To    @{URLs}[1]
    Maximize Browser Window

Load_Admin
    Go To    @{URLs}[2]
    Wait Until Page Contains    Language Studio Enterprise Translation Server
    Comment    This header must be fixed on this page.

Verify Landing Admin Page
    Go To    @{URLs}[2]
    Wait Until Page Contains    Language Studio Enterprise Translation Server
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[1]
    ${LicenseTab}=    Get Text    //*[@id="divmessage"]/h3
    Should Contain    ${LicenseTab}    Please activate license by uploading the license file.
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[2]
    ${EngModelsTab}=    Get Text    //*[@id="divmessage"]/h3
    Should Contain    ${EngModelsTab}    Please activate license by uploading the license file.
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[3]
    ${EngInstanceTab}=    Get Text    //*[@id="divmessage"]/h3
    Should Contain    ${EngInstanceTab}    Please activate license by uploading the license file.
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[4]
    ${SettingTab}=    Get Text    //*[@id="divmessage"]/h3
    Should Contain    ${SettingTab}    Please activate license by uploading the license file.
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[5]
    ${ResetTab}=    Get Text    //*[@id="divmessage"]/h3
    Should Contain    ${ResetTab}    Please activate license by uploading the license file.
    Go To    @{URLs}[1]
    Page Should Contain    Please activate license by uploading the license file.
    Go To    @{URLs}[2]

Verify Title Page
    Title Should Be    Language Studio Private and Secure Translation

Verify CopyRight
    ${Copy_right}=    Get Text    xpath=//*[@id="divCopyright"]
    Should Contain    ${Copy_right}    2018 Omniscien Technologies

Verify Logo is Existing
    Click Element    xpath=//*[@id="imgLogo"]

Verify Custom Header
    ${XMLFile}=    Set Variable    ${XMLPATH}XMLConfig.xml
    ${pageheading}=    Get Element Text    ${XMLFile}    display/lang[@id="en"]/heading/pageheading
    Page Should Contain    ${pageheading}

Verify Main Elements
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    Simplified Chinese to English (Patents and Legal)
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    English to Simplified Chinese (Patents and Legal)
    Click Element    xpath=//*[@id="btnTranslate"]
    Element Should Contain    xpath=//*[@id="buttonreset"]    Reset
    Element Should Contain    xpath=//*[@id="buttoncopy"]    Copy
    Click Image    xpath=//*[@id="imgLanguages"]
    Verify Language List

Verify Text Elements
    Page Should Contain    Text
    Page Should Contain    Translated Text
    Page Should Contain    Enter text here...
    Page Should Contain    Text translation...
    Click Element    xpath=//*[@id="imgClear"]
    Element Should Contain    xpath=//*[@id="lblLimit"]    0/5000

Verify Documents Elements
    Page Should Contain    Document(s)
    Element Should Contain    xpath=//*[@id="draglabel1"]    Drag and Drop Files
    Element Should Contain    xpath=//*[@id="draglabel2"]    into this Box
    Element Should Contain    xpath=//*[@id="draglabel3"]    or
    Element Should Contain    xpath=//*[@id="buttonbrowse"]    Browse for Files
    Element Should Contain    xpath=//*[@id="documentoutputformatlabel"]    Output Format
    Element Should Contain    //*[@id="sameasdocumentlabel"]    Same as Document
    Element Should Contain    //*[@id="htmllabel"]    HTML
    Element Should Contain    //*[@id="textlabel"]    Text file
    Element Should Contain    //*[@id="documentaftertranslationlabel"]    After Translation
    Element Should Contain    //*[@id="downloadlabel"]    Download Document
    Element Should Contain    //*[@id="emaildocumentlabel"]    Email Document as Attachment
    Element Should Not Contain    //*[@id="txtEmail"]    @
    Click Image    //*[@id="imgSupport"]

Verify Language List
    [Documentation]    List of Lang Mode
    Element Should Contain    xpath=//*[@id="PageLangSelect"]    English
    Element Should Contain    xpath=//*[@id="PageLangSelect"]    中文
    Element Should Contain    xpath=//*[@id="PageLangSelect"]    ภาษาไทย
    Element Should Contain    xpath=//*[@id="PageLangSelect"]    French
