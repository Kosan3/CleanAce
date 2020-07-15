class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :fare
      t.integer :billing_total
      t.integer :payment_method
      t.string :postal_code
      t.string :address
      t.string :address_name

      t.timestamps
    end
  end
end
