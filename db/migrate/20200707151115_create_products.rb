class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :introduction
      t.string :image_id

      t.timestamps
    end
  end
end
