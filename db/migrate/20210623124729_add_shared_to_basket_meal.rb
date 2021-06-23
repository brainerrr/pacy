class AddSharedToBasketMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :basket_meals, :shared, :integer, default: 0, null: false
  end
end
