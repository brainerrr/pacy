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

  def to_stripe_hash
    if self.quantity != self.quantity.to_i        # if basket_meal.quantity is a float
      # we re rounding it down
      basket_meal_quantity = self.quantity.to_i
      half_hash = half_item_hash(self)
      if basket_meal_quantity.zero?
        half_hash
      else
        # create exactly that hash below
        whole_hash = item_hash(self, basket_meal_quantity)
        # additionally, create a meal.name 1/2 with quantity = 1, amount = half 1 meal
        [whole_hash, half_hash]
      end
    else
      item_hash(self)
    end
  end

  private

  def item_hash(basket_meal, basket_meal_quantity = nil)
    {
      name: basket_meal.meal.name,
      images: [ApplicationController.helpers.cl_image_path(basket_meal.meal.photo.key)],
      amount: basket_meal.meal.price_cents,
      currency: 'eur',
      quantity: basket_meal_quantity ? basket_meal_quantity.to_i : basket_meal.quantity.to_i
    }
  end

  def half_item_hash(basket_meal)
    {
      name: " 1/2 #{basket_meal.meal.name}",
      images: [ApplicationController.helpers.cl_image_path(basket_meal.meal.photo.key)],
      amount: basket_meal.meal.price_cents / 2,
      currency: 'eur',
      quantity: 1
    }
  end

end
