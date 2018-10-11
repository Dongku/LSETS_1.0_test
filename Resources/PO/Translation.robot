*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Resource          SwitchLang.robot
Resource          ../Common.robot
Resource          OutputFormat.robot
Resource          DataCSV.robot

*** Keywords ***
DC1_TEXT_TX
    Do_Reset
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    ${curPath}=    Set Variable    ${DATAPATH}Source_EN.txt
    ${GetInputText}=    OperatingSystem.Get File    ${curPath}
    Comment    ${GetInputText}=    OperatingSystem.Get File    ./LSETS_1.0/Resources/TestFile/Source_EN.txt
    Log    ${GetInputText}
    Input Text    //*[@id="txtText"]    ${GetInputText}
    Check Disable DocumentTX
    Get Text Count
    Element Should Not Contain    //*[@id="lblLimit"]    0/5000
    Click Image    //*[@id="btnTranslate"]
    sleep    3s
    Element Should Not Contain    //*[@id="txtTranslation"]    Text translation...
    Capture Page Screenshot

DC1_TEXT_TX_5000
    Do_Reset
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    ${curPath}=    Set Variable    ${DATAPATH}Source_EN_5000.txt
    ${GetInputText}=    OperatingSystem.Get File    ${curPath}
    Comment    ${GetInputText}=    OperatingSystem.Get File    ./LSETS_1.0/Resources/TestFile/Source_EN_5000.txt
    Input Text    //*[@id="txtText"]    ${GetInputText}
    Check Disable DocumentTX
    Get Text Count
    Element Should Contain    //*[@id="lblLimit"]    Maximum characters exceeded
    Element Should Not Contain    //*[@id="headinglable"]    Document(s)
    sleep    3s
    Capture Page Screenshot

DC2_TEXT_TX
    Do_Reset
    Select From List    //*[@id="selEngine"]    @{LANG[2]}
    ${curPath}=    Set Variable    ${DATAPATH}Source_FR.txt
    ${GetInputText}=    OperatingSystem.Get File    ${curPath}
    Comment    ${GetInputText}=    OperatingSystem.Get File    ./LSETS_1.0/Resources/TestFile/Source_FR.txt
    Log    ${GetInputText}
    Input Text    //*[@id="txtText"]    ${GetInputText}
    Check Disable DocumentTX
    Get Text Count
    Element Should Not Contain    //*[@id="lblLimit"]    0/5000
    Click Image    //*[@id="btnTranslate"]
    sleep    3s
    Element Should Not Contain    //*[@id="txtTranslation"]    Text translation...
    Element Should Not Contain    //*[@id="headinglable"]    Document(s)
    Capture Page Screenshot

DC2_TEXT_TX_5000
    Do_Reset
    Select From List    //*[@id="selEngine"]    @{LANG[2]}
    ${curPath}=    Set Variable    ${DATAPATH}Source_FR_5000.txt
    ${GetInputText}=    OperatingSystem.Get File    ${curPath}
    Comment    ${GetInputText}=    OperatingSystem.Get File    ./LSETS_1.0/Resources/TestFile/Source_FR_5000.txt
    Input Text    //*[@id="txtText"]    ${GetInputText}
    Check Disable DocumentTX
    Get Text Count
    Element Should Contain    //*[@id="lblLimit"]    Maximum characters exceeded
    Element Should Not Contain    //*[@id="headinglable"]    Document(s)
    sleep    3s
    Capture Page Screenshot

EN_BATCH_MSWord_Single
    [Timeout]    5 minutes
    Do_Reset
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[0]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .docx
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_MSExcel_Single
    [Timeout]    5 minutes
    Do_Reset
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[2]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .xlsx
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_MSPowerPoint_Single
    [Timeout]    5 minutes
    Do_Reset
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[4]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .pptx
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_HTML_Single
    [Timeout]    5 minutes
    Do_Reset
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[6]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .html
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_TXT_Single
    [Timeout]    5 minutes
    Do_Reset
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[8]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .txt
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_PDF_Single
    [Timeout]    5 minutes
    Do_Reset
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[9]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .pdf
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_MSOutlook_Single
    [Timeout]    5 minutes
    Do_Reset
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[10]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .msg
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_MSWord_Double
    [Timeout]    5 minutes
    Do_Reset
    ${curPath1}=    Set Variable    ${PATH}@{FILEPATH}[0]
    ${curPath2}=    Set Variable    ${PATH}@{FILEPATH}[1]
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath1}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    sleep    5s
    Choose File    //*[@id="fBrowseFile"]    ${curPath2}
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Comment    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Comment    Element Should Be Visible    //*[@id="tr8"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr8"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

EN_BATCH_MultipleFile
    [Timeout]    5 minutes
    Do_Reset
    ${GetCSVPath}=    Set Variable    ${DATAPATH}TestData.csv
    ${All file}=    Read CSV File    ${GetCSVPath}
    : FOR    ${FILE}    IN    @{All file}
    \    Log    @{FILE}[0] - @{FILE}[1]
    \    ${curPath}=    Set Variable    ${PATH}@{FILE}[1]
    \    Log    ${curPath}
    \    Run Keyword If    '@{FILE}[0]'=='Exit'    Exit For Loop
    \    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    \    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    \    Click Image    //*[@id="imgBrowseFile"]
    \    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    \    sleep    5s
    \    Click Image    //*[@id="btnTranslate"]
    \    sleep    5s
    Capture Page Screenshot

EN_BATCH_MSWord_FormatSelect
    [Timeout]    5 minutes
    ${curPath}=    Set Variable    ${PATH}@{FILEPATH}[0]
    Log    ${curPath}
    Select From List    //*[@id="selEngine"]    @{LANG[1]}
    Comment    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    ${curPath}
    sleep    2s
    Check Disable TextTX
    Click Image    //*[@id="btnTranslate"]
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    .docx
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

Clear_TEXT_TX
    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    ${curPath}=    Set Variable    ${DATAPATH}Source_EN.txt
    ${GetInputText}=    OperatingSystem.Get File    ${curPath}
    Comment    ${GetInputText}=    OperatingSystem.Get File    ./LSETS_1.0/Resources/TestFile/Source_EN.txt
    Input Text    //*[@id="txtText"]    ${GetInputText}
    Check Disable DocumentTX
    ${GetText_Before}=    Get Text    //*[@id="lblLimit"]
    sleep    3s
    Click Image    xpath=//*[@id="imgClear"]
    Check Page Reset
    ${GetText_After}=    Get Text    //*[@id="lblLimit"]
    Should Not Be Equal    ${GetText_Before}    ${GetText_After}
    Capture Page Screenshot

ZH_BATCH_MSWord_Single
    [Timeout]    5 minutes
    Do_Reset
    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    @{FILEPATH}[2]
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    ZH_demo1.docx
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot

ZH_BATCH_MSWord_Multi
    [Timeout]    5 minutes
    Do_Reset
    Select From List By Index    //*[@id="selEngine"]    @{LANG}[0]
    Click Image    //*[@id="imgBrowseFile"]
    Choose File    //*[@id="fBrowseFile"]    @{FILEPATH}[2]
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Choose File    //*[@id="fBrowseFile"]    @{FILEPATH}[3]
    sleep    2s
    Click Image    //*[@id="btnTranslate"]
    Check Disable TextTX
    sleep    5s
    Page Should Contain    Status
    Page Should Contain    After Translation
    Page Should Contain    ZH_demo1.docx
    Page Should Contain    ZH_demo2.doc
    Element Should Be Visible    //*[@id="tr4"]/td[7]/img
    Wait Until Element Contains    //*[@id="tr4"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Wait Until Element Contains    //*[@id="tr8"]/td[6]/a    Complete    timeout=${TXTimeouts}
    Capture Page Screenshot
