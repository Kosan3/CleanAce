class Admin::ProductImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def create
    image = ProductImage.new(product_image_params)
    image.product_id = params[:product_id]
    image.save
    redirect_to admin_product_path(params[:product_id])
  end

  private

  def product_image_params
    params.require(:product_image).permit(:image,:caption)
  end
end
