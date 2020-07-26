class Admin::ProductDetailsController < ApplicationController
  def index
  end

  def new
    @product_detail = ProductDetail.new
    @product_detail.build_product_size
    @product_detail.build_product_color
  end

  def create
    @product_detail = ProductDetail.new(product_detail_params)
    @product_detail.save
    redirect_to admin_product_path(@product_detail.product_id)
  end

  def show
    @product_detail = ProductDetail.new
    @product_detail.build_product_size
    @product_detail.build_product_color
    @product = Product.find(params[:id])
    @product_details = ProductDetail.where(product_id: params[:id])
    @image = ProductImage.new
    @images = ProductImage.where(product_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_detail_params
    params.require(:product_detail).permit(:introduction, :image, :non_taxed_price, :product_id, product_size_attributes: [:size], product_color_attributes: [:color])
  end
end
