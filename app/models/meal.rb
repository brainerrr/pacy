class Meal < ApplicationRecord
  monetize :price_cents
  belongs_to :restaurant
  has_many :basket_meals, dependent: :destroy
  CATEGORIES = ['Starter', 'Main', 'Dessert', 'Beverages']
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, :description, :category, presence: true
  has_one_attached :photo
end
