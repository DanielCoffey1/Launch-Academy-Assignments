class Clinic < ActiveRecord::Base
  has_many :comments
  has_many :students
  validates :title, presence: true
  validates :speaker, presence: true
end
