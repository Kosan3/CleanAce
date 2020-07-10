class Admin::ProductImagesController < ApplicationController
  def create
    image = ProductImage.new(product_image_params)
    image.type_id = params[:type_id]
    image.save
    redirect_to admin_product_path(params[:type_id])
  end

  private

  def product_image_params
    params.require(:product_image).permit(:image,:caption)
  end
end
