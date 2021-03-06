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
            "id": 26,
            "created_at": "2013-06-12T04:39:44Z",
            "updated_at": "2013-06-12T04:39:44Z",
            "user_id": 12,
            "friend_id": 11,
            "user_username": "testaccount2",
            "friend_username": "testaccount",
            "final_cut_url": "nil",
            "verses": [
                {
                    "id": 14,
                    "created_at": "2013-06-12T04:39:44Z",
                    "user_id": 12,
                    "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/014/original/123.mp3"
                },
                {
                    "id": 15,
                    "created_at": "2013-06-12T04:43:23Z",
                    "user_id": 11,
                    "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/015/original/124.mp3"
                }
            ]
        }
    ]
### Show
    GET    /api/v1/raps/:id
####Request:
    {
        #only auth_token that is sent in the http header and the proper id in the path
    }
####Response:
    {
        "id": 26,
        "created_at": "2013-06-12T04:39:44Z",
        "updated_at": "2013-06-12T04:39:44Z",
        "user_id": 12,
        "friend_id": 11,
        "user_username": "testaccount2",
        "friend_username": "testaccount",
        "final_cut_url": "nil",
        "verses": [
            {
                "id": 14,
                "created_at": "2013-06-12T04:39:44Z",
                "user_id": 12,
                "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/014/original/canvas.pdf"
            },
            {
                "id": 15,
                "created_at": "2013-06-12T04:43:23Z",
                "user_id": 11,
                "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/015/original/canvas.pdf"
            }
        ]
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
        "id": 26,
        "created_at": "2013-06-12T04:39:44Z",
        "updated_at": "2013-06-12T04:39:44Z",
        "user_id": 12,
        "friend_id": 11,
        "user_username": "testaccount2",
        "friend_username": "testaccount",
        "final_cut_url": "http://s3.amazonaws.com/passthemic_testing/raps/final_cuts/000/000/021/original/214.mp3",
        "verses": [
            {
                "id": 14,
                "created_at": "2013-06-12T04:39:44Z",
                "user_id": 12,
                "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/014/original/canvas.pdf"
            },
            {
                "id": 15,
                "created_at": "2013-06-12T04:43:23Z",
                "user_id": 11,
                "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/015/original/canvas.pdf"
            }
        ]
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
### Create
    POST   /api/v1/verses
####Request:
  A request can be made in two ways.  If there is no rap created yet then you will follow this format:
    {
        "rap" {
            "user_id": "4",
            "friend_id": "5"
        }
        "verse": {
            "user_id": "4",
            "rap_id": "",
            "vocal_track": "284.mp3"
            #your vocal_track
        }
    }
  If there is already a rap_id  then your request will follow this format:
        {
            "rap" {
                "user_id": "",
                "friend_id": ""
            }
            # the rap item can be left out of your json request if easier for you.
            "verse": {
                "user_id": "4",
                "rap_id": "22",
                "vocal_track": "284.mp3"
                #your vocal_track
            }
        }
####Response:
    {
        "rap": {
            "id": 26,
            "user_id": 12,
            "friend_id": 11,
            "user_username": "testaccount2",
            "friend_username": "testaccount"
        },
        "verse": {
            "id": 23,
            "created_at": "2013-06-13T21:01:40Z",
            "user_id": 11,
            "rap_id": 26,
            "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/014/original/284.mp3"
        }
    }
### Show
    GET    /api/v1/verses/:id
####Request:
    {
        #only auth_token that is sent in the http header and the proper id in the path.
    }
####Response:
    {
        "rap": {
            "id": 26,
            "user_id": 12,
            "friend_id": 11,
            "user_username": "testaccount2",
            "friend_username": "testaccount"
        },
        "verse": {
            "id": 23,
            "created_at": "2013-06-13T21:01:40Z",
            "user_id": 11,
            "rap_id": 26,
            "vocal_track_url": "http://s3.amazonaws.com/passthemic_testing/verses/vocal_tracks/000/000/014/original/284.mp3"
        }
    }
### Destroy
    DELETE /api/v1/verses/:id
####Request:
    {
        #only auth_token that is sent in the http header and the proper id in the path.
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