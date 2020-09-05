class AddCancelCheckedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cancel_checked, :boolean, default: false, null: false
  end
end
