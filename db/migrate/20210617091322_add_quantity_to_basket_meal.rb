class AddQuantityToBasketMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :basket_meals, :quantity, :integer
  end
end
