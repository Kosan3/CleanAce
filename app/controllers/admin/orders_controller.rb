class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def index
    if params[:page] == 'today'
      if params[:status] != 'cancel'
        @orders = Order.where(cancel: false, order_checked: false)
      else
        @orders = Order.today_cancels
      end
    elsif params[:page] == 'checked'
      @orders = Order.where(order_checked: true, shipping: false)
    elsif params[:page] == 'shipping'
      @orders = Order.where(shipping: true)
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = Order.find(params[:id]).order_products.includes(:product_detail)
  end

  def check
    order = Order.find(params[:order_id])
    if order.order_checked == false
      order.order_checked = true
    elsif order.order_checked == true
      order.shipping = true
    end
    order.save
    redirect_to admin_admin_path
  end
end
