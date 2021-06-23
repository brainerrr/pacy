class ChangeAmountName < ActiveRecord::Migration[6.0]
  def change
    rename_column :baskets, :amount_cents, :total_price_cents
  end
end
