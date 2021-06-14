class Basket < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many :basket_meals
end
