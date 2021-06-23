class AddPriceToMeals < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :price, :integer
    add_monetize :meals, :price, currency: { present: false }
  end
end
