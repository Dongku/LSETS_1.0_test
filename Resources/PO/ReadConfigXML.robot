*** Settings ***
Library           XML
Library           Selenium2Library
Library           OperatingSystem
Library           String
Resource          Landing.robot

*** Keywords ***
Load_XML_Web
    Click Element     //*[@id="tblMain"]/tbody/tr[2]/td/a[4]
    ${GetNewXML}=    Get Text    //*[@id="xml"]
    Create File    ${XMLPATH}/XMLConfig.xml    ${GetNewXML}
    Wait Until Created    ${XMLPATH}/XMLConfig.xml

bk_XML_Test
    ${XMLFile}=    Set Variable    ${XMLPATH}LSETXServerConfig.xml
    ${root}=    Parse Xml    ${XMLFile}
    Should Be Equal    ${root.tag}    config
    ${api}=    Get Element    ${XMLFile}    settings/api/apikey
    Should Be Equal    ${api.text}    RESTAPIKey-lsetsruntime
    ${api}=    Get Element    ${XMLFile}    settings/api/apikey
    Should Be Equal    ${api.text}    RESTAPIKey-lsetsruntime
    ${mtengines}=    Get Element    ${XMLFile}    settings/mtengines/mtengine[1]
    Should Be Equal    ${mtengines.attrib['id']}    1
    Should Be Equal    ${mtengines.attrib['sourcelang']}    EN
    ${display1}=    Get Element    ${XMLFile}    display/lang[1]
    Log    ${display1.attrib['id']}
    Log    ${display1.attrib['name']}
    ${ID_new}=    Set Variable    ${display1.attrib['id']}
    ${Name_new}=    Set Variable    ${display1.attrib['name']}

bk_XML_Test_Web
    ${XMLWeb}=    Set Variable    ${XMLPATH}XMLConfig.xml
    ${root}=    Parse Xml    ${XMLWeb}
    Should Be Equal    ${root.tag}    config
    ${api}=    Get Element    ${XMLWeb}    settings/api/apikey
    Should Be Equal    ${api.text}    RESTAPIKey-lsetsruntime
    Log    ${api.text}
