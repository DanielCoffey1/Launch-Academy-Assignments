class Recipe < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, inclusion: { in: ("brussels sprouts") }
end
