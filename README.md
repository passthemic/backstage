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
####Request:
    {
        "user": {
            "username": "testaccount",
            "email": "user@example.com",
            "password": "12345678",
            "password_confirmation": "12345678"
        }
    }
####Response:
    {
        "id": 6,
        "created_at": "2013-06-05T16:34:38Z",
        "updated_at": "2013-06-05T16:34:38Z",
        "username": "testaccount10",
        "email": "user10@example.com",
        "auth_token": "XoFDTTzGzoJUsjSHGpae"
    }
****

##Login
    POST   /api/v1/sessions
####Request:
    {
        "user": {
            "username": "testaccount",
            "password": "12345678"
        }
    }
####Response:
    {
        "id": 5,
        "created_at": "2013-05-30T21:46:31Z",
        "updated_at": "2013-06-05T01:36:56Z",
        "username": "testaccount",
        "email": "user3@example.com",
        "auth_token": "ZF6qC8XyQq9oFkAgiqez"
    }
****

##Logout
    DELETE /api/v1/sessions
####Request:
    {
        #only auth_token that is sent in the http header
    }
####Response:
    {
        "success": true,
        "info": "Logged out",
        "data": {}
    }
****

##Rap
### Index
    GET    /api/v1/raps
####Request:
    {
        #only auth_token that is sent in the http header
    }
####Response:
    [
        {
                "id": 8,
                "created_at": "2013-05-30T18:08:00Z",
                "updated_at": "2013-05-30T18:08:00Z",
                "user_id": 1,
                "friend_id": 4,
                "final_cut_url": "nil"
            },
            {
                "id": 12,
                "created_at": "2013-05-30T18:25:37Z",
                "updated_at": "2013-05-30T18:25:37Z",
                "user_id": 4,
                "friend_id": 3,
                "final_cut_url": "http://s3.amazonaws.com/passthemic_testing/raps/final_cuts/000/000/009/original/1.mp3"
            }
        }
    ]
### Create
    POST   /api/v1/raps
####Request:
    {
        "rap": {
            "user_id": "4",
            "friend_id": "8"
        }
    }
####Response:
    {
        "id": 21,
        "created_at": "2013-05-30T22:06:02Z",
        "updated_at": "2013-05-30T22:06:02Z",
        "user_id": 4,
        "friend_id": 8,
        "final_cut_url": "nil"
    }
### Show
    GET    /api/v1/raps/:id
####Request:
    {
        #only auth_token that is sent in the http header and the proper id in the path
    }
####Response:
    {
        "id": 21,
        "created_at": "2013-05-30T22:06:02Z",
        "updated_at": "2013-05-30T22:06:02Z",
        "user_id": 4,
        "friend_id": 8,
        "final_cut_url": "nil"
    }
### Update
    PUT    /api/v1/raps/:id
####Request:
    {
        "rap": {
            "final_cut": "214.mp3" 
            #your file with the final spliced together vocal_tracks.
        }
    }
####Response:
    {
        "id": 21,
        "created_at": "2013-05-30T22:06:02Z",
        "updated_at": "2013-05-30T22:11:45Z",
        "user_id": 4,
        "friend_id": 8,
        "final_cut_url": "http://s3.amazonaws.com/passthemic_testing/raps/final_cuts/000/000/021/original/214.mp3"
    }
### Destroy
    DELETE /api/v1/raps/:id
####Request:
    {
        #only auth_token that is sent in the http header and the proper id in the path.
    }
####Response:
    {
        "success": true,
        "info": "rap: 21 deleted",
        "data": {}
    }
****


##Verse
### Index
    GET    /api/v1/raps/:rap_id/verses
####Request:
    {
        #only auth_token that is sent in the http header and the proper rap_id in the path.
    }
####Response:
    [
        {
            "id": 3,
            "created_at": "2013-05-30T22:18:39Z",
            "user_id": 4,
            "rap_id": 22,
            "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/003/original/284.mp3"
        },
        {
            "id": 4,
            "created_at": "2013-05-30T22:18:39Z",
            "user_id": 8,
            "rap_id": 23,
            "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/003/original/285.mp3"
        }
    ]
### Create
    POST   /api/v1/raps/:rap_id/verses
####Request:
    {
        "verse": {
            "user_id": "4",
            "rap_id": "22",
            "vocal_track": "284.mp3"
            #your vocal_track
        }
    }
####Response:
    {
        "id": 3,
        "created_at": "2013-05-30T22:18:39Z",
        "user_id": 4,
        "rap_id": 22,
        "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/003/original/284.mp3"
    }
### Show
    GET    /api/v1/raps/:rap_id/verses/:id
####Request:
    {
        #only auth_token that is sent in the http header and the proper rap_id and id in the path.
    }
####Response:
    {
        "id": 3,
        "created_at": "2013-05-30T22:18:39Z",
        "user_id": 4,
        "rap_id": 22,
        "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/003/original/284.mp3"
    }
### Destroy
    DELETE /api/v1/raps/:rap_id/verses/:id
####Request:
    {
        #only auth_token that is sent in the http header and the proper rap_id and id in the path.
    }
####Response:
    {
        "success": true,
        "info": "verse: 3 deleted",
        "data": {}
    }

****

##Friend
### Index
    GET    /api/v1/friends
####Request:
    {
        #only auth_token that is sent in the http header and the proper rap_id in the path.
    }
####Response:
    [
        {
            "id": 2,
            "created_at": "2013-05-30T09:10:50Z",
            "updated_at": "2013-05-30T09:40:33Z",
            "username": "testuser",
            "email": "user@example.com"
        },
        {
            "id": 3,
            "created_at": "2013-05-30T09:29:56Z",
            "updated_at": "2013-05-30T09:46:17Z",
            "username": "anotheruser",
            "email": "user1@example.com"
        },
        {
            "id": 7,
            "created_at": "2013-06-07T18:55:12Z",
            "updated_at": "2013-06-07T18:55:12Z",
            "username": "testaccount11",
            "email": "user11@example.com"
        }
    ]

****