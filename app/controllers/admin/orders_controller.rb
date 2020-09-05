class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def index
    case params[:page]
    when 'order'
      @orders = Order.where(order_checked: false, cancel: false)
    when 'order_checked'
      @orders = Order.where(order_checked: true, cancel: false, shipping: false)
    when 'shipping'
      @orders = Order.where(shipping: true, cancel: false)
    when 'cancel'
      @orders = Order.where(cancel: true, cancel_checked: false)
    when 'cancel_checked'
      @orders = Order.where(cancel: true, cancel_checked: true)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = Order.find(params[:id]).order_products.includes(:product_detail)
  end

  def check
    order = Order.find(params[:order_id])
    if order.cancel == true
      if order.cancel_checked == false
        order.cancel_checked = true
      end
    elsif order.cancel == false
      if order.order_checked == false
        order.order_checked = true
      elsif order.order_checked == true
        if order.shipping == false
          order.shipping = true
        end
      end
    end
    order.save
    redirect_to admin_admin_path
  end
end
