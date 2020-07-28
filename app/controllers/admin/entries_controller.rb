class Admin::EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :protect_admin

  def index
    if params[:page] == 'today'
      @entries = Entry.today_entries
    else
      @entries = Entry.all
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
