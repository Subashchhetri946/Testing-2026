*** Settings ***
Library        OperatingSystem
Library        Collections
Library        String

*** Comments ***
// My Name: Subash Chhetri
*** Variables ***
${input_file}        E:/Profile/Web-Dev-Projects/Testing-2026/Robot Folder/webpages.txt
${result_file}       E:/Profile/Web-Dev-Projects/Testing-2026/Robot Folder/ping_result.txt

*** Test Cases ***
Read addresses from ping command from file
    ${text}=     Get File    ${input_file}
    @{addresses}=    Split String   ${text}
    Set Global Variable    ${addresses}


Find out IP, average ping time in loop and create result file
    ${text}=     Get File    ${input_file}
    @{addresses}=    Split String   ${text}
    Set Global Variable    ${addresses}
    Create File    ${result_file}    Website - IP address - Average ping time\n
    ${count}=    Get Length    ${addresses}
    FOR    ${index}    IN RANGE    ${count}

        ${output}=     Run And Return Rc And Output   ping ${addresses}[${index}]
        Log    ${output}

        #1
        ${text}=    Set Variable    ${output}[1]

        #2
        @{parts}=    Split String    ${text}    [
        @{parts}=    Split String    ${parts}[1]    ]
        ${ip}=    Set Variable    ${parts}[0]


        #3
        @{parts}=    Split String    ${text}    Average
        @{parts}=    Split String    ${parts}[1]    =
        ${average}=    Remove String    ${parts}[1]    ms
        @{parts}=    Split String    ${average}
        ${average}=    Set Variable    ${parts}[0]

        Append To File    ${result_file}    ${addresses}[${index}] - ${ip} - ${average} ms\n
        
        #
        Run Keyword And Continue On Failure    Should Be True    ${average} < 50    Average ping for ${addresses}[${index}] must be below 50 ms (actual: ${average} ms).
    END
    