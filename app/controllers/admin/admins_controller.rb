class Admin::AdminsController < ApplicationController
  before_action :protect_admin

  def top
    @entries = Entry.today_entries
    @orders = Order.today_orders
  end

end
