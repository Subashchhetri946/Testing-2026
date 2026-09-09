*** Settings ***
Library               SeleniumLibrary

*** Test Cases ***
webtest
    Open Browser  https://www.google.com    Chrome    options=add_experimental_option("detach", True)