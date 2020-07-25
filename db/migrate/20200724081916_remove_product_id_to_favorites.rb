class RemoveProductIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :product_id
  end
end
