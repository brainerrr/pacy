class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_meals
  validates :name, :price, :description, presence: true
end
