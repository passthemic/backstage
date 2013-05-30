object @verse
attributes :id, :created_at, :user_id, :rap_id
node(:vocal_track_url) { |verse| verse.vocal_track.url(:original, timestamp: false) }