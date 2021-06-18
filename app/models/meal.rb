class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_meals, dependent: :destroy
  CATEGORIES = ['Starter', 'Main', 'Dessert', 'Beverages']
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, :price, :description, :category, presence: true
  has_one_attached :photo
end
