class FavoritesController < ApplicationController
  def create
    @product = Product.find(params[:product_detail_id])
    favorite = current_user.favorites.new(product_id: @product.id)
    favorite.save
  end

  def destroy
    @type = Product.find(params[:product_detail_id])
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
  end
end
