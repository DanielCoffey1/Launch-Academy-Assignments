class User < ActiveRecord::Base
  has_many :groups
  has_many :projects, through: :groups
  has_many :tasks, through: :projects

  validates :first_name, presence: true
  validates :last_name, presence: true
end
