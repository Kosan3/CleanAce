class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :last_name
      t.string :first_name
      t.string :kana_last_name
      t.string :kana_first_name
      t.string :postal_code
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :position
      t.string :age
      t.text :other

      t.timestamps
    end
  end
end
