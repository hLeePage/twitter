class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  max_paginates_per 25
end
