class AddAmountToBasket < ActiveRecord::Migration[6.0]
  def change
    add_monetize :baskets, :amount, currency: { present: false }
  end
end
