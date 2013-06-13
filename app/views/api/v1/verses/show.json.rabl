object false
child(@rap) {
              attributes :id, :user_id, :friend_id
              node(:user_username) { |rap| find_user_username(rap) }
              node(:friend_username) { |rap| find_friend_username(rap) }
            }
child(@verse) {
              attributes :id, :created_at, :user_id, :rap_id
              node(:vocal_track_url) { |verse| verse.vocal_track.url(:original, timestamp: false) }
            }