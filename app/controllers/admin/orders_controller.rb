class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def index
    if params[:page] == 'today'
      if params[:status] != 'cancel'
        @orders = Order.today_orders
      else
        @orders = Order.today_cancels
      end
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = Order.find(params[:id]).order_products.includes(:product_detail)
  end
end
