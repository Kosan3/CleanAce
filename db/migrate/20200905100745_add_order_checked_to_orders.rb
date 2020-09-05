class AddOrderCheckedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_checked, :boolean, default: false, null: false
  end
end
