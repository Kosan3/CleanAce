class OrdersController < ApplicationController
  before_action :set_current_user, :set_carts
  TAX = 1.1

  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def confirmation
    @order = Order.new(order_params)
    if params[:address_key] == "my_address"
      @order.get_shipping_informations_from(@user)
    elsif params[:address_key] == "other_address"
      select_address = @user.ships.find(params[:order][:ship])
      @order.get_shipping_informations_from(select_address)
    else params[:address_key] == "new_address"

    end
  end

  def create
    order = @user.orders.new(order_params)
    order.fare = 800
    binding.pry
    order.billing_total = order.fare + @carts.sum(&:subtotal) * TAX
  end

  def complete
  end

  private

  def set_current_user
    @user = current_user
  end

  def set_carts
    @carts = @user.carts.includes(product: [:type, :product_color, :product_size])
  end

  def order_params
    params.require(:order).permit(:postal_code,:address,:address_name)
  end
end
