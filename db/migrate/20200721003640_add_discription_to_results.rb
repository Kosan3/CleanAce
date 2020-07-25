class AddDiscriptionToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :description, :text
  end
end
