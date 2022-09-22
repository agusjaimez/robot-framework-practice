*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
# Locators
${LoggedInIcon}    id:login-active
${UserNameField}    id:email
${PasswordField}    id:upass
${LogInButton}    id:nick-submit
${LogOutButton}    xpath://i[@class="head-icon icon-signout"]
${desired}    Evaluate  {"enableVideo": True, "enableLog": True, "enableVNC": True, "provider": "zebrunner"}

*** Keywords ***
Setup
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    ...    %{REMOTE_DRIVER_URL}    ${desired}
    Maximize Browser Window

Log User
    [Arguments]    ${user}    ${password}
    Wait Until Element Is Enabled    ${LoggedInIcon}
    Click Element    ${LoggedInIcon}
    Input Text    ${UserNameField}    ${user}
    Input Text    ${PasswordField}    ${password}
    Click Element    ${LogInButton}
    Wait Until Page Contains    Login successful.

Log Out
    Wait Until Page Contains Element    ${LogOutButton}    5
    Click Element    ${LogOutButton}
    