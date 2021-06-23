class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :basket_meals, :quantity, { from: nil, to: 1.0 }
  end
end
