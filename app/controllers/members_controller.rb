class MembersController < ApplicationController
  def index
    @members = Member.all.order(uniform_number: :asc)
  end

  def show
  end
end
