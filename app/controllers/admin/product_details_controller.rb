class Admin::ProductDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin
  before_action :set_product_data, only: [:edit, :update]

  def create
    @product_detail = ProductDetail.new(product_detail_params)
    if @product_detail.save
      redirect_to admin_product_path(params[:product_id])
    else
      @product = Product.find(params[:product_id])
      @product_details = ProductDetail.where(product_id: params[:product_id]).includes(:product_color, :product_size)
      @image = ProductImage.new
      @images = ProductImage.where(product_id: params[:product_id])
      @product_image_url = "https://dmm-test-rsize.s3-ap-northeast-1.amazonaws.com/store/" + @product.image_id + "-thumbnail."
      @image_url = "https://dmm-test-rsize.s3-ap-northeast-1.amazonaws.com/store/" + @product.image_id + "-thumbnail."
      render 'admin/products/show'
    end
  end

  def edit
  end

  def update
    if @product_detail.update(product_detail_params)
      redirect_to admin_product_path(params[:product_id])
    else
      render 'admin/product_details/edit'
    end
  end

  def destroy
    product_detail = ProductDetail.find(params[:id])
    product_detail.destroy
    redirect_to admin_product_path(params[:product_id])
  end

  private

  def product_detail_params
    params.require(:product_detail).permit(:introduction,
                                           :image, :non_taxed_price,
                                           product_size_attributes: [:size],
                                           product_color_attributes: [:color]).merge(product_id: params[:product_id])
  end

  def set_product_data
    @product = Product.find(params[:product_id])
    @product_detail = ProductDetail.find(params[:id])
  end
end
