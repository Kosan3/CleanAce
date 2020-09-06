class OrdersController < ApplicationController
  before_action :set_current_user, :set_carts
  TAX = 1.1

  def index
    if (params[:status] != 'cancel')
      @orders = @user.orders.where(cancel: false).includes(order_products: [product_detail: [:product]])
    else
      @orders = @user.orders.where(cancel: true).includes(order_products: [product_detail: [:product]])
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = Order.find(params[:id]).order_products.includes(product_detail: [:product, :product_color, :product_size])
  end

  def new
    @order = Order.new
  end

  def confirmation
    @order = @user.orders.new(order_params)
    if params[:address_key] == "my_address"
      @order.get_shipping_informations_from(@user)
      session[:ship_data] = false
    elsif params[:address_key] == "other_address"
      if params[:order][:ship].present?
        select_address = @user.ships.find(params[:order][:ship])
        @order.get_shipping_informations_from(select_address)
        session[:ship_data] = false
      else
        render :new
      end
    else params[:address_key] == "new_address"
      render :new unless @order.valid?
      session[:ship_data] = true
    end
    @order.designated_date = nil if params[:designated_key] == 'no_designated'
  end

  def create
    ship_data = session[:ship_data]
    order = @user.orders.new(order_params)
    order.fare = 800
    order.billing_total = order.fare + @carts.sum(&:subtotal) * TAX
    order.payment_method = "transfer"
    OrderMailer.creation_email(order).deliver_now if order.save
    order.create_order_products(@user)
    order.create_ship(@user, ship_data)
    @carts.each(&:destroy)
    redirect_to complete_orders_path
  end

  def complete
  end

  def cancel
    order = Order.find(params[:id])
    order_date = order.created_at.to_date
    today = Date.current
    difference = (today - order_date).to_i
    if (difference < 3)
      order.cancel = true
      order.save
      redirect_to order_path(order), notice: "注文をキャンセルしました。"
    else
      redirect_to order_path(order), notice: "こちらの注文商品は発送済みです。\n
      お手数ですが、注文商品キャンセルの場合は、弊社までご連絡ください。"
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  def set_carts
    @carts = @user.carts.includes(product_detail: [:product, :product_color, :product_size])
  end

  def order_params
    params.require(:order).permit(:postal_code, :address, :address_name, :designated_date)
  end
end
