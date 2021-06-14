class BasketMeal < ApplicationRecord
  belongs_to :basket
  belongs_to :meal
end
