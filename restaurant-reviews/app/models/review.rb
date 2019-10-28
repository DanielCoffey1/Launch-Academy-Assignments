class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, presence: true, numericality: true
  validates :body, presence: true
end
