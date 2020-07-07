class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :type_id
      t.integer :product_name_id
      t.integer :product_color_id
      t.integer :product_size_id
      t.text :introduction
      t.string :image_id
      t.integer :non_taxed_price

      t.timestamps
    end
  end
end
