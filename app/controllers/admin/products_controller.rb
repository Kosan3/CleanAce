class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product.build_product_size
    @product.build_product_color
  end

  def create
    params[:type_id]
    @product = Product.new(product_params)
    binding.pry
    @product.save
    redirect_to admin_product_path(@product.type_id)
  end

  def show
    @product = Product.new
    @product.build_product_size
    @product.build_product_color
    @type = Type.find(params[:id])
    @products = Product.where(type_id: params[:id])
    @image = ProductImage.new
    @images = ProductImage.where(type_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:introduction, :image, :non_taxed_price, :type_id, product_size_attributes: [:size], product_color_attributes: [:color])
  end
end
