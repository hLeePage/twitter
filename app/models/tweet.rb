class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  max_paginates_per 25


  def self.timeline(user)
    follower_ids = user.followers.map(&:id)
    all_ids= follower_ids << user.id
    Tweet.where(user_id: all_ids).order("created_at DESC")
  end

end
