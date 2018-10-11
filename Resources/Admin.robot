*** Settings ***
Library           SSHLibrary
Library           Selenium2Library
Library           AutoItLibrary

*** Keywords ***
SSH_LogIn
    Open Connection    @{HOST}[0]
    Login    @{HOST}[1]    @{HOST}[2]

SSH_DockerUser_LogIn
    Write    sudo su dockeruser
    Write    @{HOST}[2]
    SSHLibrary.Directory Should Exist    /home/dockeruser/lsets/

Run Shell Delete
    SSHLibrary.Directory Should Exist    /home/dockeruser/lsets/
    Write    cd /home/dockeruser/lsets/; ./deleteall.sh
    Read    delay=10s

Run Shell Start
    SSHLibrary.Directory Should Exist    /home/dockeruser/lsets/
    Write    cd /home/dockeruser/lsets/; ./run-all.sh
    Read    delay=10s

Upload Invalid License
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[1]
    ${LicenseTab}=    Get Text    //*[@id="divmessage"]/h3
    Should Contain    ${LicenseTab}    Please activate license by uploading the license file.
    ${curInvalidLicPath}=    Set Variable    ${DATAPATH}\License\\Invalidfile.lic
    Log    ${curInvalidLicPath}
    Choose File    //*[@id="tblMain"]/tbody/tr[4]/td/input    ${curInvalidLicPath}
    sleep    2s
    ${LicenseUploaded}=    Get Text    //*[@id="divmessage"]/h3
    Should Contain    ${LicenseUploaded}    Invalid license file. Please contact Omniscien Technologies.
    Should Not Contain    ${LicenseUploaded}    License file successfully uploaded.
    Element Should Not Be Visible    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[1]/td[1]/b
    Element Should Not Be Visible    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[1]/td[2]/b

Upload Forward License
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[1]
    ${LicenseTab}=    Get Text    //*[@id="divmessage"]/h3
    Comment    Should Contain    ${LicenseTab}    Please activate license by uploading the license file.
    ${curInvalidLicPath}=    Set Variable    ${DATAPATH}\License\\forward.lic
    Log    ${curInvalidLicPath}
    Choose File    //*[@id="tblMain"]/tbody/tr[4]/td/input    ${curInvalidLicPath}
    sleep    2s
    ${LicenseUploaded}=    Get Text    //*[@id="divmessage"]/h3
    Should Not Contain    ${LicenseUploaded}    License file successfully uploaded.
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[1]
    Should Contain    ${LicenseUploaded}    License expired. Please contact Omniscien Technologies.
    Element Should Not Be Visible    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[1]/td[1]/b
    Element Should Not Be Visible    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[1]/td[2]/b

Upload Expired License
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[1]
    ${LicenseTab}=    Get Text    //*[@id="divmessage"]/h3
    Comment    Should Contain    ${LicenseTab}    Please activate license by uploading the license file.
    ${curInvalidLicPath}=    Set Variable    ${DATAPATH}\License\\Expired.lic
    Log    ${curInvalidLicPath}
    Choose File    //*[@id="tblMain"]/tbody/tr[4]/td/input    ${curInvalidLicPath}
    sleep    2s
    ${LicenseUploaded}=    Get Text    //*[@id="divmessage"]/h3
    Should Not Contain    ${LicenseUploaded}    License file successfully uploaded.
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[1]
    Should Contain    ${LicenseUploaded}    License expired. Please contact Omniscien Technologies.
    Element Should Not Be Visible    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[1]/td[1]/b
    Element Should Not Be Visible    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[1]/td[2]/b

Upload Valid License
    [Documentation]    Version 1.1
    ...    - 2018-09-25: Upload button must be apprear even if user completed uploading the Valid Licence file.
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[1]
    ${LicenseTab}=    Get Text    //*[@id="divmessage"]/h3
    Comment    Should Contain    ${LicenseTab}    Please activate license by uploading the license file.
    ${curInvalidLicPath}=    Set Variable    ${DATAPATH}\License\\custom.lic
    Log    ${curInvalidLicPath}
    Choose File    //*[@id="tblMain"]/tbody/tr[4]/td/input    ${curInvalidLicPath}
    sleep    2s
    ${LicenseUploaded}=    Get Text    //*[@id="divmessage"]/h3
    Should Not Contain    ${LicenseUploaded}    Invalid file format. Please try again.
    Should Contain    ${LicenseUploaded}    License uploaded successfully.
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[4]/td/input
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[1]/td[1]/b
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[1]/td[2]/b
    Page Should Contain    Organization Name
    Page Should Contain    Organization Address
    Page Should Contain    Organization Contact Name
    Page Should Contain    Organization Email
    Page Should Contain    Organization Contact Title
    Page Should Contain    License Start Date
    Page Should Contain    icense End Date
    Page Should Contain    Instance License
    Page Should Contain    Load on demand permitted
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[2]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[3]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[4]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[5]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[6]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[7]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[8]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[9]/td[2]
    Element Should Be Visible    //*[@id="tblMain"]/tbody/tr[5]/td/table/tbody/tr[10]/td[2]

Upload Engines
    Comment    Put File    ./LSETS_1.0/Resources/Engines/Test*.zip
    Comment    Put File    ./LSETS_1.0/Resources/Engines/Test*.zip    newline=CRLF
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[2]
    ${ExistingModel}=    Get Text    //*[@id="tblMain"]/tbody/tr[4]/td/h4
    Should Contain    ${ExistingModel}    No engines have been installed. Please install the engine into system.
    SSH_LogIn
    SSH_DockerUser_LogIn
    Put File    ./LSETS_1.0/Resources/Engines/2018082*.zip    /home/dockeruser/lsets/data/services/lsetx/resources/enginezip    mode=0775
    Put File    ./LSETS_1.0/Resources/Engines/2018081*.zip    /home/dockeruser/lsets/data/services/lsetx/resources/enginezip    mode=0775
    SSHLibrary.List Files In Directory    /home/dockeruser/lsets/data/services/lsetx/resources/enginezip/
    Close All Connections

Delete Engines
    [Timeout]    5 minutes
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[2]
    Page Should Contain    File Name
    Page Should Contain    Install
    Page Should Contain    Install Date
    Page Should Contain    Delete
    Page Should Contain    .zip
    Click Element    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[2]/td[4]/input
    Confirm Action
    Wait Until Page Contains    Model deleted.    timeout=None

Install Engines
    [Timeout]    15 minutes
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[2]
    Page Should Contain    File Name
    Page Should Contain    Install
    Page Should Contain    Install Date
    Page Should Contain    Delete
    Page Should Contain    .zip
    Click Element    //*[@id="tblMain"]/tbody/tr[4]/td/table/tbody/tr[2]/td[2]/input
    Wait Until Page Contains    Install model successfully.    timeout=None

Setup Instance
    [Timeout]    5 minutes
    Click Element    //*[@id="tblMain"]/tbody/tr[2]/td/a[3]
    Page Should Contain    Instance #
    Page Should Contain    Engine Model
    Page Should Contain    Container No
    ${default}=    Get Text    //*[@id="domaincode0"]/option[1]
    Should Be Equal    ${default}    No Engine Assign
    Click Element    //*[@id="domaincode0"]/option[2]
    Click Element    //*[@id="tblMain"]/tbody/tr[5]/td/input
    Wait Until Page Contains    Save instances successfully.    timeout=None
