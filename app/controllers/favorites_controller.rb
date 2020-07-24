class FavoritesController < ApplicationController
  def create
    @type = Type.find(params[:product_id])
    favorite = current_user.favorites.new(type_id: @type.id)
    favorite.save
  end

  def destroy
    @type = Type.find(params[:product_id])
    favorite = current_user.favorites.find_by(type_id: @type.id)
    favorite.destroy
  end
end
