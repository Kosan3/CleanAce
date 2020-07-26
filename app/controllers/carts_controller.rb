class CartsController < ApplicationController
  before_action :cart_authenticate_user!
  before_action :set_current_user

  def index
    @carts = @user.carts.includes(product_detail: [:product, :product_color, :product_size])
  end

  def create
    product = Product.find(params[:product_id])
    if select_product = product.squeeze_product(params)
      if @user.has_in_cart(select_product)
        in_cart = @user.has_in_cart(select_product)
        new_quantity = in_cart.quantity + cart_params[:quantity].to_i
        in_cart.update(quantity: new_quantity)
      else
        cart = Cart.new(product_detail_id: select_product.id, user_id: current_user.id, quantity: cart_params[:quantity])
        cart.save
      end
      redirect_to carts_path
    else
      redirect_to product_path(product), alert: "サイズとカラーを選択してください"
    end
  end

  def update
    cart_product = @user.carts.find_by(product_detail_id: params[:id])
    update_quantity = cart_params[:quantity].to_i
    cart_product.update(quantity: update_quantity)
    redirect_to carts_path
  end

  def destroy
    cart_product = @user.carts.find_by(product_detail_id: params[:id])
    cart_product.destroy
    redirect_to carts_path
  end

  def destroy_all
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity)
  end

  def set_current_user
    @user = current_user
  end

  def cart_authenticate_user!
    unless current_user
      redirect_to sign_in_path, alert: "カートを利用するにはログインしてください"
    end
  end

end
