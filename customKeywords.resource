*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Locators
${LoggedInIcon}    id:login-active
${UserNameField}    id:email
${PasswordField}    id:upass
${LogInButton}    id:nick-submit
${LogOutButton}    xpath://i[@class="head-icon icon-signout"]

*** Keywords ***
Setup
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Log User
    [Arguments]    ${user}    ${password}
    Click Element    ${LoggedInIcon}
    Input Text    ${UserNameField}    ${user}
    Input Text    ${PasswordField}    ${password}
    Click Element    ${LogInButton}
    Wait Until Page Contains    Login successful.

Log Out
    Wait Until Page Contains Element    ${LogOutButton}    5
    Click Element    ${LogOutButton}
    