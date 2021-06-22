class ChangeQuantityColumnToDecimal < ActiveRecord::Migration[6.0]
  def up
    change_column :basket_meals, :quantity, :float
  end

  def down
    change_column :basket_meals, :quantity, :integer, default: 0
  end
end
