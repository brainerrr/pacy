class ChangeStatusColumnToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :baskets, :status, :string
    add_column :baskets, :status, :integer, default: 0, null: false
  end
end
