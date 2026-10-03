*** Settings ***
Library      String
Library      Dialogs
Library    OperatingSystem
Library     E:\Profile\Web-Dev-Projects\Testing-2026\Robot Folder\mylibrary.py

*** Keywords ***
Get Word From List
    [Arguments]        ${text}
    @{list}=    Split String      ${text}
    @{word}=    Set Variable      ${list}[${index}]
    RETURN       ${word}


*** Test Cases ***
New text test
    ${text}=        Set Variable         Red Roses and Blue Sky
    ${word}=        Get Word From List         Red Roses and Blue Sky