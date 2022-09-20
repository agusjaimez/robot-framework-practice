*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Locators
${LoggedInIcon}    id:login-active
${UserNameField}    id:email
${PasswordField}    id:upass
${LogInButton}    id:nick-submit
${LogOutButton}    xpath://i[@class="head-icon icon-signout"]
${remote_Url}    https://vd2:2HS729SnKHKTnV4j@engine.zebrunner.org/wd/hub
${desired}    Evaluate  {"enableVideo": True, "enableLog": True, "enableVNC": True, "provider": "zebrunner"}

*** Keywords ***
Setup
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    ...    ${remote_Url}    ${desired}
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
    