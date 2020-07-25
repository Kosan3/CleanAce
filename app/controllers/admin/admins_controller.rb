class Admin::AdminsController < ApplicationController
  def top
    @entries = Entry.today_entries
    @orders = Order.today_orders
  end
end
