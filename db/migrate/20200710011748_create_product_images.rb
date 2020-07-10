class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.integer :type_id
      t.string :image_id
      t.string :caption

      t.timestamps
    end
  end
end
