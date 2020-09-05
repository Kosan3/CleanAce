class AddShippingToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping, :boolean, default: false, null: false
  end
end
