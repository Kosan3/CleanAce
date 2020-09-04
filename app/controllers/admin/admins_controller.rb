class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def top
    @entries = Entry.today_entries
    @orders = Order.today_orders
  end
end
