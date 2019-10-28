class Project < ActiveRecord::Base
  has_many :tasks
  has_many :groups
  has_many :users, through: :groups

  validates :name, presence: true
end
