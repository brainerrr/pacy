class Basket < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many :basket_meals, dependent: :destroy
  has_many :meals, through: :basket_meals
  attribute :status, :string, default: 'Pending'
  STATUSES = ["Pending", "Confirmed"]
  validates :status, presence: true
  validates :status, inclusion: { in: STATUSES }
end
