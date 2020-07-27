class Admin::ProductsController < ApplicationController
  before_action :protect_admin

  def index
    @products = Product.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end

  def show
    @product_detail = ProductDetail.new
    @product_detail.build_product_size
    @product_detail.build_product_color
    @product = Product.find(params[:id])
    @product_details = ProductDetail.where(product_id: params[:id]).includes(:product_color, :product_size)
    @image = ProductImage.new
    @images = ProductImage.where(product_id: params[:id])
  end

  def edit
  end

  def update
  end


  private

  def product_params
    params.require(:product).permit(:product_name,:introduction,:image)
  end
end
