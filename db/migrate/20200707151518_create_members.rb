class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :en_name
      t.string :position
      t.text :introduction
      t.integer :uniform_number

      t.timestamps
    end
  end
end
