class Admin::UsersController < ApplicationController
  before_action :protect_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
end
