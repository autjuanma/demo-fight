Feature: Get request scenarios

Background:
  * url 'https://jsonplaceholder.typicode.com'


Scenario: get all posts and then get the first post by id
  Given path 'posts'
  When method get
  Then status 200

  * def firstPost = response[0]

  Given path 'posts', firstPost.id
  When method get
  Then status 200


Scenario: get all comments and then get the first comment by id
  Given path 'comments'
  When method get
  Then status 200

  * def firstComment = response[0]

  Given path 'comments', firstComment.id
  When method get
  Then status 200


Scenario: get all albums and then get the first album by id
  Given path 'albums'
  When method get
  Then status 200

  * def firstAlbum = response[0]

  Given path 'albums', firstAlbum.id
  When method get
  Then status 200


Scenario: get all photos and then get the first photo by id
  Given path 'photos'
  When method get
  Then status 200

  * def firstPhoto = response[0]

  Given path 'photos', firstPhoto.id
  When method get
  Then status 200


Scenario: get all todos and then get the first todo by id
  Given path 'todos'
  When method get
  Then status 200

  * def firstTodo = response[0]

  Given path 'todos', firstTodo.id
  When method get
  Then status 200