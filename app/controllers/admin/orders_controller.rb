class Admin::OrdersController < ApplicationController
  def index
    if params[:page] == 'today'
      @orders = Order.today_orders
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
