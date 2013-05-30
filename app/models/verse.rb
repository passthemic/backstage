class Verse < ActiveRecord::Base
  attr_accessible :rap_id, :user_id, :vocal_track
  validates_presence_of :user_id
  validates_presence_of :rap_id
  validates_presence_of :vocal_track

  belongs_to :user
  belongs_to :rap
  has_attached_file :vocal_track,
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS


end
