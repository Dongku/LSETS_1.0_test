*** Settings ***
Library           ../../Custom/CSVLibrary.py

*** Keywords ***
Read_CSV
    ${All file}=    Read CSV File    ${DATAPATH}
    : FOR    ${FILE}    IN    @{All file}
    \    Log    @{FILE}[0] - @{FILE}[0]
