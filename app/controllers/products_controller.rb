class ProductsController < ApplicationController
  def index
  end

  def show
    @type = Type.find(params[:id])
    @products = Product.where(type_id: params[:id])
    @images = ProductImage.where(type_id: params[:id])
  end

  def top
  end
end
