class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def top
    @entries = Entry.today_entries
    @orders = Order.all
    @finish_orders = Order.finish_orders
    @cancels = Order.where(cancel: true, cancel_checked: false)
    @finish_cancels = Order.finish_cancels
  end
end
