Feature: Create account 

Background: 
Given url "https://tek-insurance-api.azurewebsites.net"
And path "api/token"
 And request {"username" : "supervisor" , "password" :"tek_supervisor"}
When method post
Then status 200
* def generatedToken=response.token
Scenario: add new account 
 Given  path "api/accounts/add-primary-account"
 And request {
  "email": "QA@gmail.com",
  "firstName": "Fatima",
  "lastName": "fARES",
  "title": "Ms.",
  "gender": "FEMALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "EMPLOYED",
  "dateOfBirth": "1999-09-22"
}
And header Authorisation ="Bearer "+generatedToken
When  method post
Then status 201
And print response



 


