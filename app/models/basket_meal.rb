class BasketMeal < ApplicationRecord
  belongs_to :basket
  belongs_to :meal
  attribute :quantity, :integer, default: 1
end
