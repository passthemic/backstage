#Pass the Mic API V1 Documentation
##General Info
All requests *except* registration and login require the user's auth_token to be passed in the http header:
####Header
    Authorization
####Value
    Token token="pP1zQJLWo8A7yTcdPNu4"
****

##Create an account:
    POST   /api/v1/registrations

##Login
    POST   /api/v1/sessions

##Logout
    DELETE /api/v1/sessions
****


##Rap
### Index
    GET    /api/v1/raps
### Create
    POST   /api/v1/raps
### Show
    GET    /api/v1/raps/:id
### Update
    PUT    /api/v1/raps/:id
### Destroy
    DELETE /api/v1/raps/:id
****


##Verse
### Index
    GET    /api/v1/raps/:rap_id/verses
### Create
    POST   /api/v1/raps/:rap_id/verses
### Show
    GET    /api/v1/raps/:rap_id/verses/:id
### Update
    PUT    /api/v1/raps/:rap_id/verses/:id
### Destroy
    DELETE /api/v1/raps/:rap_id/verses/:id
