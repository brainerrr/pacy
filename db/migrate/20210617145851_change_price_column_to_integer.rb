class ChangePriceColumnToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :meals, :price, :integer
  end
end
