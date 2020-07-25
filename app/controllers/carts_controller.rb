class CartsController < ApplicationController
  before_action :cart_authenticate_user!
  before_action :set_current_user

  def index
    @carts = @user.carts.includes(product: [:type, :product_color, :product_size])
  end

  def create
    type = Type.find(params[:product_id])
    select_product = type.squeeze_product(params)
    if @user.has_in_cart(select_product)
      in_cart = @user.has_in_cart(select_product)
      new_quantity = in_cart.quantity + cart_params[:quantity].to_i
      in_cart.update(quantity: new_quantity)
    else
      cart = Cart.new(product_id: select_product.id, user_id: current_user.id, quantity: cart_params[:quantity])
      cart.save
    end
    redirect_to carts_path
  end

  def update
  end

  def destroy
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
