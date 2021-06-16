class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_meals, dependent: :destroy
  validates :name, :price, :description, presence: true
  has_one_attached :photo
end
