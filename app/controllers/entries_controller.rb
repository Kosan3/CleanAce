class EntriesController < ApplicationController

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    redirect_to root_path
  end

  private
  def entry_params
    params.require(:entry).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:postal_code,
      :address,:email,:phone_number,:position,:other,:age)
  end
end
