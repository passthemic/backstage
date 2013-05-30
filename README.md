#Pass the Mic API V1 Documentation


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
