*** Settings ***
Resource    customKeywords.resource
Library    BuiltIn
Library    SeleniumLibrary
Suite Setup    Setup    ${url}    ${browser}
Suite Teardown    Close Browser

*** Variables ***
${url}    https://www.gsmarena.com/
${browser}    chrome

*** Test Cases ***
Test LogIn
    Log User    %{USER}    %{PASSWORD}
    ${location}    Get Location

Test LogOut
    Log out
    Wait Until Page Contains Element    ${LoggedInIcon}    5
    Click Element    ${LoggedInIcon}
    Element Should Be Visible    ${LogInButton}