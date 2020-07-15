class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :opponent_team
      t.integer :top_first
      t.integer :bottom_first
      t.integer :top_second
      t.integer :bottom_second
      t.integer :top_third
      t.integer :bottom_third
      t.integer :top_fourth
      t.integer :bottom_fourth
      t.integer :top_fifth
      t.integer :bottom_fifth
      t.integer :top_sixth
      t.integer :bottom_sixth
      t.integer :top_seventh
      t.integer :bottom_seventh

      t.timestamps
    end
  end
end
