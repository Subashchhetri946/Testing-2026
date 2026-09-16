*** Settings ***
Library      String
Library      Dialogs
Library    OperatingSystem
Library      Collections


*** Variables ***
${one}       Donald
${two}       Duck   

@{list}      1       2           3            4 


*** Test Cases ***
Create Data For Tests
    @{names}=     Create List     Donald        Mickey     Goofy
    Set Test Varible 


*** Test Cases ***
Check outcome
    ${three}=   Set Variable     Donald Duck
    Should Be Equal   ${three}    ${one} ${two}

Ask user input
    #${user}=   Get Value From User    Please input your text
    ${user}=    Set Variable    Hello
    Should Be Equal    ${user}     Hello

Check value frmo List
    ${number}=     Set Variable     ${list}[2]
    Should Be Equal        ${number}          3


Add value to List
    ${addition}=  Set Variable      333
    Append To List   ${list}        ${addition}
    Log     ${list}
    Should Be Equal     ${list}[4]      ${addition}






Remove from List
    ${new}=       Remove From List           ${names}      0
    Should Be Equal          ${new}       Donald
    Should Be Equal          ${names}[0]    Mickey


Loop the List
    FOR   ${index}       IN Range           1           10
        Log     ${index}
    END


Make a new directory
    Create Directory           C:\Testing 2026\testing
    Directory Should Exist        C:\Testing 2026\testing
