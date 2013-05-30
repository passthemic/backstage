class Rap < ActiveRecord::Base
  attr_accessible :final_cut, :friend_id, :user_id
  validates_presence_of :user_id
  belongs_to :user
  has_attached_file :final_cut,
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS,
                    :default_url => "nil"

  def self.find_raps_created_by_or_invited_to(user)
    self.where('user_id = ? OR friend_id = ?', user.id, user.id)
  end

end
