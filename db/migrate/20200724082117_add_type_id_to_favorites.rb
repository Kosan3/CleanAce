class AddTypeIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :type_id, :integer
  end
end
