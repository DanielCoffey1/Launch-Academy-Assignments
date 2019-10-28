class Party < ActiveRecord::Base
  has_many :guests
  has_many :friends, through: :guests
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
end
