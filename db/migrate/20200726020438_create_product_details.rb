class CreateProductDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :product_details do |t|
      t.integer :product_id
      t.integer :product_color_id
      t.integer :product_size_id
      t.integer :non_taxed_price

      t.timestamps
    end
  end
end
