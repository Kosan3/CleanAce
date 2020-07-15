class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :type_name
      t.text :introduction
      t.string :image_id

      t.timestamps
    end
  end
end
