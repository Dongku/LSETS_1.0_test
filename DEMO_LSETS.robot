*** Settings ***
Suite Setup       Begin Web Test
Suite Teardown    End Web Browser
Library           Selenium2Library
Library           OperatingSystem
Library           Dialogs
Library           string
Library           Collections
Resource          Resources/Common.robot
Resource          Resources/PO/Landing.robot
Resource          Resources/PO/SwitchLang.robot
Resource          Resources/PO/Translation.robot
Resource          Resources/PO/OutputFormat.robot
Resource          Resources/PO/DataCSV.robot
Resource          Resources/PO/ReadConfigXML.robot
Resource          Resources/Admin.robot
Resource          Resources/PO/Download.robot

*** Variables ***
${BROWSER}        chrome
${TXTimeouts}     120s
${PATH}           D:\\Workspace\\RobotWork\\TestProject\\LSETS\\LSETS_1.0\\Resources\\TestFile\\Example MSOffice\\
${DATAPATH}       D:\\Workspace\\RobotWork\\TestProject\\LSETS\\LSETS_1.0\\Resources\\TestFile\\
${XMLPATH}        D:\\Workspace\\RobotWork\\TestProject\\LSETS\\LSETS_1.0\\
@{FILEPATH}       demo1.docx    demo2.doc    demo1.xlsx    demo2.xls    demo1.pptx    demo2.ppt    demo1.html
...               demo2.htm    demo.txt    demo.pdf    demo.msg
@{EMAIL}          jaturong.rattanakate@omniscien.com
@{URLs}           http://172.17.105.173:9090    http://172.17.101.26    http://admin:p@s$w0rd@172.17.101.26/lsets/admin/    http://172.17.101.26    http://admin:p@s$w0rd@172.17.101.26/lsets/admin/    http://172.17.101.140    http://admin:p@s$w0rd@172.17.101.140/lsetx/admin/
...               # Please setup before test.
@{LANG}           0    1    2    3
@{HOST}           172.17.101.140    administrator    p@s$w0rd    @{URLs}[1]

*** Test Cases ***
Select Test Browser
    [Tags]    test1
    ${new_browser}=    Get Selection From User    Which Test Browser?    Chrome    Firefox    edge
    Set Global Variable    ${BROWSER}    ${new_browser}

Admin Setting
    [Documentation]    Admin Setting for Questel only
    [Tags]    admintest
    Load_Admin
    Verify Landing Admin Page
    Upload Invalid License
    Upload Expired License
    Upload Forward License
    Upload Valid License
    Comment    Load_XML_Web
    Comment    Upload Engines
    Comment    Delete Engines
    Comment    Install Engines
    Comment    Setup Instance

TC001_Landing_Page
    [Documentation]    Test Verify Landing Page and Main Page Objects verifications.
    [Tags]    smoke
    Load
    English_Mode

TC002_Select_LP_Mode
    [Documentation]    Test verify Language display switched over
    [Tags]    smoke
    Load
    English_Mode
    Chinese_Mode
    Thai_Mode
    French_Mode

TC003_TextTX_NotExceed
    [Documentation]    Test verify Translate TEXT not Exceed 5000 chars.
    [Tags]    smoke
    Load
    English_Mode
    DC1_TEXT_TX
    Comment    DC2_TEXT_TX

TC004_TextTX_Exceeded
    [Documentation]    Test verify Translate TEXT Exceed 5000 chars with Error message.
    [Tags]    smoke
    Load
    English_Mode
    DC1_TEXT_TX_5000
    Comment    DC2_TEXT_TX_5000

TC005_ClearInputText
    [Documentation]    Test verify Clear Text function.
    [Tags]    smoke
    Load
    Clear_TEXT_TX

TC006_BatchTX_MSWord
    [Documentation]    Test verify Translation with MSWord document.
    [Tags]    smoke
    Load
    EN_BATCH_MSWord_Single

TC007_BatchTX_MSExcel
    [Documentation]    Test verify Translation with MSExcel document.
    [Tags]    smoke
    Load
    EN_BATCH_MSExcel_Single

TC008_BatchTX_MSPowerPoint
    [Documentation]    Test verify Translation with MSPowerPoint document.
    [Tags]    smoke
    Load
    EN_BATCH_MSPowerPoint_Single

TC009_BatchTX_HTML
    [Documentation]    Test verify Translation with HTM.HTML document.
    [Tags]    smoke
    Load
    EN_BATCH_HTML_Single

TC010_BatchTX_TXT
    [Documentation]    Test verify Translation with Plain Text document.
    [Tags]    smoke
    Load
    EN_BATCH_TXT_Single

TC011_BatchTX_PDF
    [Documentation]    Test verify Translation with PDF document. (v1.0 Not support PDF)
    [Tags]    smoke
    Load
    EN_BATCH_PDF_Single

TC012_BatchTX_MSOutlook
    [Documentation]    Test verify Translation with MSOutlook document.
    [Tags]    smoke
    Load
    EN_BATCH_MSOutlook_Single

TC014_SaveSameDoc
    [Documentation]    Test verify Translation with Save Same as Document.
    [Tags]    smoke
    Load
    Do_RESET
    ClearAllCheckBox
    Sleep    120s
    SaveToSameDoc

TC015_SaveHTML
    [Documentation]    Test verify Translation save as HTML format.
    [Tags]    smoke
    Load
    Do_RESET
    ClearAllCheckBox
    SaveToHTML

TC016_SaveText
    [Documentation]    Test verify Translation with save as Text format.
    [Tags]    smoke
    Load
    Do_RESET
    ClearAllCheckBox
    SaveToText

TC017_SaveMultiple
    [Documentation]    Test verify Translation with Save Multiple format (Same/HTML/Text).
    [Tags]    smoke
    Load
    Do_RESET
    ClearAllCheckBox
    SaveToAll

TC018_Email_Selected
    [Documentation]    Test verify After Translation and Emailing.
    [Tags]    smoke
    Load
    Do_RESET
    Email_document
    SaveToAll

TC019_Download File
    [Documentation]    Test Verify Download the File is completed.
    [Tags]    smoke
    Load
    Do_RESET
    ClearAllCheckBox
    SaveToAll
    Download_TX_File

TC020_Deleted TX Job
    [Documentation]    Test verify Translated Job can be deleted.
    [Tags]    smoke
    Load
    Do_RESET
    ClearAllCheckBox
    SaveToAll
    Deleting Job

Admin_DockerStart
    [Tags]    do not test
    [Setup]    SSH_Login
    SSH_DockerUser_LogIn
    Comment    Run Shell Delete
    Comment    Run Shell Start
    [Teardown]    Close All Connections

ReadConfig_XML
    [Documentation]    Read custom XML configurations.
    [Tags]    do not test
    Load_XML_Web

Engine Setup
    [Tags]    do not test
    [Setup]    SSH_Login
    Comment    SSH_DockerUser_LogIn
    Upload Engines
    [Teardown]    Close All Connections

Test Autoit
    [Tags]    debug111
    Open Browser    https://www.engprod-charter.net/    Chrome
    Comment    Wait For Active Window    WindowText=https://www.engprod-charter.net
    Wait For Active Window    WindowTitle=https://www.engprod-charter.net/api/pub/cnetloginedge/spectrum-redir?targetUrl=https%3A%2F%2Fwww.engprod-spectrum.net%2F%3Fdomain-redirect%3Dtrue
    Win Active    https://www.engprod-charter.net
    Maximize Browser Window
    Send    {TAB}
    Send    username
    Send    {TAB}
    Send    Password
    Send    {ENTER}
    Sleep    3s
    Close Browser

*** Keywords ***
