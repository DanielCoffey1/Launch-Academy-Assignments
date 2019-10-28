class Guest < ActiveRecord::Base
  belongs_to :friend
  belongs_to :party
  validates :party_id, presence: true
  validates :friend_id, presence: true
end
