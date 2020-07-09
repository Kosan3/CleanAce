class CreateProductNames < ActiveRecord::Migration[5.2]
  def change
    create_table :product_names do |t|
      t.string :name
      t.text :introduction

      t.timestamps
    end
  end
end
