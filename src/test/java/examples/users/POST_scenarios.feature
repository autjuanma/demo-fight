Feature: Post Scenarios 


Background:
  * url 'https://jsonplaceholder.typicode.com'


Scenario: create a user and then retrieve it by id
  * def user = read('user.json')
  
  Given path 'users'
  And request user
  When method post
  Then status 201

  * def id = response.id
  * print 'created id is: ', id

  Given path 'users', id
  When method get
  Then status 200
  And match response contains user


Scenario: create multiple users and verify their creation
  * def users = read('users.json')

  * def createdIds = []
  * def expectedUsers = []

  * karate.forEach(users, function(u) {
      Given path 'users'
      And request u
      When method post
      Then status 201
      * def id = response.id
      * createdIds.push(id)
      * expectedUsers.push(u)
    })

  * karate.forEach(createdIds, function(id) {
      Given path 'users', id
      When method get
      Then status 200
      And match response contains expectedUsers[createdIds.indexOf(id)]
    })


Scenario: update a user and verify the changes
  * def userUpdate =
    """
    {
      "name": "Updated User",
      "username": "updateduser",
      "email": "updated@user.com"
    }
    """

  Given path 'users', 1
  And request userUpdate
  When method put
  Then status 200

  Given path 'users', 1
  When method get
  Then status 200
  And match response.name == 'Updated User'
  And match response.username == 'updateduser'
  And match response.email == 'updated@user.com'


Scenario: delete a user and verify deletion
  Given path 'users', 1
  When method delete
  Then status 204

  Given path 'users', 1
  When method get
  Then status 404