class ProductsController < ApplicationController
  def index
    @products = Product.select(:product_name_id).distinct
  end

  def show
    @product = Product.find_by(product_name_id: params[:id])
    @products = Product.where(product_name_id: params[:id])
  end

  def top
  end
end
