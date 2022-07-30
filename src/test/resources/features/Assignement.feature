Feature: validate account 
Background: 
  Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request { "username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200
    *def generatedToken=response.token
    And print response

 Scenario: add new Account with Existing email address
    And   path "/api/accounts/add-primary-account"
    And   request
    """
     {
  "email":"naouarel@gmail.com",
  "firstName": "siham",
  "lastName": "ng",
  "title": "Ms.",
  "gender": "FEMALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Employed",
  "dateOfBirth": "1999-09-12",
  "new": true
  }
  """
    And header Authorization ="Barear "+ generatedToken 
    When method post
    Then status 400
    And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "Account with Email nawarel@gmail.com is exist"
    
    # 3)Test API endpoint "/api/accounts/add-account-car" to add car to existing account.
      # Then status code should be 201 – Create ,  validate response
      Scenario: add car to existing account 
       And path "/api/accounts/add-account-car"
       And param primaryPersonId= 10
       And request 
       """
       {
  
  "make": "Toyota",
  "model": "Camry",
  "year": "2020",
  "licensePlate": "CAR146891"
}
"""
 And header Authorization ="Barear"+ generatedToken 
    When method post
    Then status 201
    And print response
    
 # 4)Test API endpoint "/api/accounts/add-account-phone" to add Phone number to existing account.
 # Then status code should be 201 – Create ,  validate response
        Given  path "/api/accounts/add-account-phone"
         And  param primaryPersonId=10
         And  request 
         {
  "phoneNumber": "5717331999",
  "phoneExtension": "N/E",
  "phoneTime": "Morning",
  "phoneType": "Home"
}    
    And header Authorization ="Barear"+ generatedToken 
    When method post
    Then status 201
    And print response
              # 5)Test API endpoint "/api/accounts/add-account-address" to add address to existing account.
      # Then status code should be 201 – Create ,  validate response
      
      
      Given path"/api/accounts/add-account-address"
      And  param primaryPersonId=10
      And request{
  "id": 0,
  "addressType": "Apartement",
  "addressLine1": "123 columbia pike",
  "city": "Arlignton",
  "state": "VA",
  "postalCode": "2204",
  "countryCode": "2003",
  "current": true
} 
    And header Authorization ="Barear"+ generatedToken 
    When method post
    Then status 201
    And print response
      
      
      
      
      
      
      
      
      
      