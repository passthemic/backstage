module ApplicationHelper
  def find_user_username(rap)
    rap.user.username
  end
  def find_friend_username(rap)
    friend = User.find rap.friend_id
    friend.username
  end
end
