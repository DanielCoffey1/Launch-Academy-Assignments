class Student < ActiveRecord::Base
  has_many :clinics
  validates :name, presence: true
end
