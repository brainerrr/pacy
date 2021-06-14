class ChangePriceToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :meals, :price, :float
  end
end
