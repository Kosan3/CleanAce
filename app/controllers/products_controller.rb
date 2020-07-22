class ProductsController < ApplicationController
  def index
  end

  def show
    @type = Type.find(params[:id])
    @products = Product.where(type_id: params[:id])
    @images = ProductImage.where(type_id: params[:id])
    @cart = Cart.new
  end

  def top
    if request.referer.include?('/sign_in') && current_user.admin?
      redirect_to admin_admin_path
    end
    @types = Type.all
  end
end
