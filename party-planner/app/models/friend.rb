class Friend < ActiveRecord::Base
  has_many :guests
  has_many :parties, through: :guests
  validates :first_name, presence: true
  validates :last_name, presence: true
end
