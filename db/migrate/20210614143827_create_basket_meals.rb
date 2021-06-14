class CreateBasketMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_meals do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
