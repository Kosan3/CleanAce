class AddCancelToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cancel, :boolean, default: false, null: false
  end
end
