class BasketMeal < ApplicationRecord
  belongs_to :basket
  belongs_to :meal
  has_many :users, through: :basket
  validate :quantity_is_greater
  enum shared: { not_shared: 0, shared: 1 }

  def quantity_is_greater
    if quantity <= 0
      errors.add(:base, :invalid, message:"Quantity must be greater than 0")
    end
  end
end
