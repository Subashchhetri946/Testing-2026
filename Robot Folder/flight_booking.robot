*** Settings ***
Library        SeleniumLibrary
Library        String

*** Variables ***
# Subash Chhetri
${url}        http://blazedemo.com/
${browser}        Chrome
${departure}        Boston
${destination}        Cairo
${card_month}        10
${card_year}        2030

*** Test Cases ***
Open the travel website
    Open Browser    ${url}    ${browser}    options=add_argument("--log-level=3")   
    Maximize Browser Window    
    Sleep    1s

Check the welcome message
    Element Should Be Visible    xpath://h1
    Element Should Contain    xpath://h1    Welcome to the Simple Travel Agency!
    
Choose Boston
    Select From List By Value    name:fromPort    ${departure}

Choose Cairo
    Select From List By Value    name:toPort    ${destination}

Check the Find Flights button
    # checking either the button is visible or not
    Element Should Be Visible    xpath://input[@value='Find Flights' and not(@disabled)]

Search for flights
    Click Button    xpath://input[@value='Find Flights']
    Sleep    1s

Check the flight route
    Element Should Contain    xpath://h3    Flights from ${departure} to ${destination}:

Check that a flight is available
    Element Should Be Visible    xpath://table/tbody/tr[1]/td[1]/input


Save the flight details and choose it
    ${price}=    Get Text    xpath://table/tbody/tr[1]/td[6]
    ${number}=    Get Text    xpath://table/tbody/tr[1]/td[2]
    ${airline}=    Get Text    xpath://table/tbody/tr[1]/td[3]
    Set Global Variable    \${flight_price}    ${price}
    Set Global Variable    \${flight_number}    ${number}
    Set Global Variable    \${flight_airline}    ${airline}
    Log    Selected flight: ${flight_number}, ${flight_airline}, ${flight_price}
    Click Button    xpath://table/tbody/tr[1]/td[1]/input
    Sleep    1s

Check the flight price
    ${expected_price}=    Remove String    ${flight_price}    $
    ${text}=    Get Text    xpath://p[starts-with(normalize-space(.), 'Price:')]
    ${text}=    Remove String    ${text}    Price:    $
    @{parts}=    Split String    ${text}
    Should Be Equal    ${parts}[0]    ${expected_price}

Check the airline
    ${text}=    Get Text    xpath://p[starts-with(normalize-space(.), 'Airline:')]
    @{text}=    Remove String    ${text}    Airline:                
    @{parts}=    Split String    ${text}
    @{expected_parts}=    Split String    ${flight_airline}
    Should Be Equal    ${parts}    ${expected_parts}