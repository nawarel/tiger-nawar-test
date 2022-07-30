Feature: security test. token Generation test

  Scenario: generate token with valid username and  valid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request { "username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200
    And print response


  Scenario: genarate token with invalid username and valid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request { "username" : "supervisor1", "password" : "tek_supervisor"}
    When method post
    Then status 404
    And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "USER_NOT_FOUND"

  Scenario: genarate token with valid username and invalid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request { "username" : "supervisor", "password" : "tek_supervisor1"}
    When method post
    Then status 400
    And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "Password Not Matched"


   Scenario: Test token verify with valid token and invalid username
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    Given path "/api/token/verify"
    And param username = "invalid-username"
    And param token = generatedToken
    When method get
    Then status 400
    And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "Wrong Username send along with Token"
  
