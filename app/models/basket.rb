class Basket < ApplicationRecord
  belongs_to :user
  belongs_to :table
  monetize :total_price_cents
  has_many :basket_meals, dependent: :destroy
  has_many :meals, through: :basket_meals
  enum status: { pending: 0, processing_payment: 1, confirmed: 2, cancelled: -1 }
end
