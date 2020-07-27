class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_detail_id
      t.integer :quantity
      t.integer :taxed_price

      t.timestamps
    end
  end
end
