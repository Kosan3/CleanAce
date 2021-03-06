class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @product_details = ProductDetail.where(product_id: params[:id]).includes(:product_color,:product_size,:product)
    @images = ProductImage.where(product_id: params[:id])
    @cart = Cart.new
  end

  def top
    if request.referer&.include?('/sign_in') && current_user&.admin?
      redirect_to admin_admin_path
    end
    @products = Product.all.last(8)
  end
end
