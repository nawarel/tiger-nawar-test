Feature: Security test.verify token test

  Scenario: verify valid token 
  Given url "https://tek-insurance-api.azurewebsites.net"
  And path "/api/token"
  And request {"username" : "supervisor" , "password" :"tek_supervisor"}
  When method post 
  Then status 200
  * def generatedToken = response.token
  
  Given path "/api/token/verify"
  And param username = "supervisor"
  And param token = generatedToken
  When method get 
  Then status 200
  And print response

  
  Scenario: verify invalid token 
   Given url "https://tek-insurance-api.azurewebsites.net"
   Given path "/api/token/verify"
  And param username = "supervisor"
  And param token = "invalid-token-random-string"
  When method get 
  Then status 400
  And print response
  
  Scenario: verify valid token and invalid username  
  
  
  Given url "https://tek-insurance-api.azurewebsites.net"
  And path "/api/token"
  And request {"username" : "supervisor" , "password" :"tek_supervisor"}
  When method post 
  Then status 200
  * def generatedToken = response.token
  
  Given path "/api/token/verify"
  And param username = "supervisor2"
  And param token = generatedToken
  When method get
  Then status 400
  And print response 
    * def msg = response.errorMessage
    And assert msg == "Wrong Username send along with Token"
  
 
  