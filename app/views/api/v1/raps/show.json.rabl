object @rap
attributes :id, :created_at, :updated_at, :user_id, :friend_id
node(:final_cut_url) { |rap| rap.final_cut.url(:original, timestamp: false) }
