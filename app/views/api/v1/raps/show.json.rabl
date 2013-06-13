object @rap
attributes :id, :created_at, :updated_at, :user_id, :friend_id
node(:user_username) { |rap| find_user_username(rap) }
node(:friend_username) { |rap| find_friend_username(rap) }
node(:final_cut_url) { |rap| rap.final_cut.url(:original, timestamp: false) }
child :verses, :object_root => false do
  attributes :id, :created_at, :user_id
  node(:vocal_track_url) { |verse| verse.vocal_track.url(:original, timestamp: false) }
end
