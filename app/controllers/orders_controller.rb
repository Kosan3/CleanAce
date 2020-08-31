class OrdersController < ApplicationController
  before_action :set_current_user, :set_carts
  TAX = 1.1

  def index
    @orders = @user.orders.includes(order_products: [product_detail: [ :product]])
  end

  def show
    @order = Order.find(params[:id])
    @order_products = Order.find(params[:id]).order_products
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
    order.billing_total = order.fare + @carts.sum(&:subtotal) * TAX
    order.payment_method = "transfer"
    OrderMailer.creation_email(order).deliver_now if order.save
    order.create_order_products(current_user)
    @carts.each(&:destroy)
    redirect_to complete_orders_path
  end

  def complete
  end

  private

  def set_current_user
    @user = current_user
  end

  def set_carts
    @carts = @user.carts.includes(product_detail: [:product, :product_color, :product_size])
  end

  def order_params
    params.require(:order).permit(:postal_code,:address,:address_name)
  end
end
