class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product.build_product_size
    @product.build_product_color
    @product.build_product_image
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:introduction, :image, :non_taxed_price, :type_id, product_size_attributes: [:size], product_color_attributes: [:color], product_image_attributes: [:image])
  end
end
