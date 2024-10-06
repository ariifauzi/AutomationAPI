*** Settings ***
Library  RequestsLibrary
Library    Collections


*** Variables ***
${base_url}    https://reqres.in
${users}    2

*** Test Cases ***
Get_UserInfo
    create session    myssion    ${base_url}
    ${response}=    get request    myssion    /api/users/${users}

    #Validations
    ${status_code}=    Convert To String     ${response.status_code}
    Should Be Equal    ${status_code}    200
    
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    2

    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    application/json; charset=utf-8