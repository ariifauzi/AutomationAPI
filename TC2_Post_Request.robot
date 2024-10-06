*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
@{base_url}=    https://reqres.in/api

*** Test Cases ***
Put_Users
    Create Session    mysession    ${base_url}
    ${body}=    Create Dictionary    name=morpheus    job=leader
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    Post Request    mysession    /users    data=${body}    headers=${header}

    # Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201
    
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    morpheus
    Should Contain    ${res_body}    leader




