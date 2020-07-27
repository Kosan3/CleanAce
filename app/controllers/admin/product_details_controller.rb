class Admin::ProductDetailsController < ApplicationController
  before_action :set_product_data, only: [:edit, :update]

  def create
    @product_detail = ProductDetail.new(product_detail_params)
    @product_detail.save
    redirect_to admin_product_path(params[:product_id])
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
    params.require(:product_detail).permit(:introduction, :image, :non_taxed_price, product_size_attributes: [:size], product_color_attributes: [:color]).merge(product_id: params[:product_id])
  end

  def set_product_data
    @product = Product.find(params[:product_id])
    @product_detail = ProductDetail.find(params[:id])
  end
end
