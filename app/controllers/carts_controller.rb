class CartsController < ApplicationController
  def index
    @carts = current_user.carts
  end

  def create
    type = Type.find(params[:product_id])
    select_product = type.squeeze_product(params)
    if current_user.has_in_cart(select_product)
      in_cart = current_user.has_in_cart(select_product)
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

end
