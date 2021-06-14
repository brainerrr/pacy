class BasketMeal < ApplicationRecord
  belongs_to :baskets
  belongs_to :meals
end
