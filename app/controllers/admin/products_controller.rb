class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def index
    @products = Product.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      redirect_to admin_products_path
    end
  end

  def show
    @product_detail = ProductDetail.new
    @product_detail.build_product_size
    @product_detail.build_product_color
    @product = Product.find(params[:id])
    @product_details = ProductDetail.where(product_id: params[:id]).includes(:product_color, :product_size)
    @image = ProductImage.new
    @images = ProductImage.where(product_id: params[:id])
    @product_image_url = "https://dmm-test-rsize.s3-ap-northeast-1.amazonaws.com/store/" + @product.image_id + "-thumbnail."
    @image_url = "https://dmm-test-rsize.s3-ap-northeast-1.amazonaws.com/store/" + @product.image_id + "-thumbnail."
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      sleep(3)
      redirect_to admin_product_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path
  end


  private

  def product_params
    params.require(:product).permit(:product_name,:introduction,:image)
  end
end
