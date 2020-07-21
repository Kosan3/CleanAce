class Admin::EntriesController < ApplicationController
  def index
    if request.referer.include?('/admin/admins/top')
      @entries = Entry.today_entries
    else
    end
  end

  def show
  end
end
