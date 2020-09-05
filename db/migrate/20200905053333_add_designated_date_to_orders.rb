class AddDesignatedDateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :designated_date, :date
  end
end
