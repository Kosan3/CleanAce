class Admin::AdminsController < ApplicationController
  def top
    @entry = Entry.today_entries
  end
end
