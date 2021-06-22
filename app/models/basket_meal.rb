class BasketMeal < ApplicationRecord
  belongs_to :basket
  belongs_to :meal
  has_many :users, through: :basket
end
