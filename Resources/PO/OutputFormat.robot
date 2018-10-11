*** Settings ***
Library           Selenium2Library
Library           String
Resource          SwitchLang.robot
Resource          ../Common.robot
Resource          Translation.robot

*** Keywords ***
ClearAllCheckBox
    Unselect Checkbox    //*[@id="chkoutsamedoc"]
    Unselect Checkbox    //*[@id="chkouthtml"]
    Unselect Checkbox    //*[@id="chkouttext"]
    Checkbox Should Not Be Selected    //*[@id="chkoutsamedoc"]
    Checkbox Should Not Be Selected    //*[@id="chkouthtml"]
    Checkbox Should Not Be Selected    //*[@id="chkouttext"]
    Log    All Checkbox have been unchecked.
    Capture Page Screenshot

SaveToSameDoc
    Select Checkbox    //*[@id="chkoutsamedoc"]
    Checkbox Should Be Selected    //*[@id="chkoutsamedoc"]
    EN_BATCH_MSWord_FormatSelect
    Element Should Contain    //*[@id="tr4"]/td[4]    Same as Document
    Capture Page Screenshot

SaveToHTML
    Select Checkbox    //*[@id="chkouthtml"]
    Checkbox Should Be Selected    //*[@id="chkouthtml"]
    EN_BATCH_MSWord_FormatSelect
    Element Should Contain    //*[@id="tr4"]/td[4]    HTML
    Capture Page Screenshot

SaveToText
    Select Checkbox    //*[@id="chkouttext"]
    Checkbox Should Be Selected    //*[@id="chkouttext"]
    EN_BATCH_MSWord_FormatSelect
    Element Should Contain    //*[@id="tr4"]/td[4]    Text file
    Capture Page Screenshot

SaveToAll
    Select Checkbox    //*[@id="chkoutsamedoc"]
    Select Checkbox    //*[@id="chkouthtml"]
    Select Checkbox    //*[@id="chkouttext"]
    Checkbox Should Be Selected    //*[@id="chkoutsamedoc"]
    Checkbox Should Be Selected    //*[@id="chkouthtml"]
    Checkbox Should Be Selected    //*[@id="chkouttext"]
    Log    All Checkbox have been unchecked.
    EN_BATCH_MSWord_FormatSelect
    Element Should Contain    //*[@id="tr4"]/td[4]    Same as Document
    Element Should Contain    //*[@id="tr4"]/td[4]    HTML
    Element Should Contain    //*[@id="tr4"]/td[4]    Text file
    Capture Page Screenshot

Email_document
    Comment    Select Radio Button    rAfterTran    email
    Click Element    //*[@id="emaildocumentlabel"]
    Input Text    //*[@id="txtEmail"]    @{EMAIL}[0]
    Capture Page Screenshot
