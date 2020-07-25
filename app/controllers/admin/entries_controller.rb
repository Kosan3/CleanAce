class Admin::EntriesController < ApplicationController
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
