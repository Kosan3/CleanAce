class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_types_path
  end

  def edit
  end

  def update
  end


  private

  def product_params
    params.require(:product).permit(:product_name,:introduction,:image)
    endermit(:introduction, :image, :non_taxed_price, :type_id, product_size_attributes: [:size], product_color_attributes: [:color])
  end
end
