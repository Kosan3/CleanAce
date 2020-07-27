class Admin::MembersController < ApplicationController
  before_action :set_all_members, only: [:new,:create]
  before_action :protect_admin

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to new_admin_member_path
    else
      render 'admin/members/new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to new_admin_member_path
    else
      render 'admin/members/edit'
    end
  end

  def destroy
    member = Member.find(params[:id])
    member.destroy
    redirect_to new_admin_member_path
  end

  private

  def member_params
    params.require(:member).permit(:name,:en_name,:position,:introduction,:uniform_number)
  end

  def set_all_members
    @members = Member.all.order(uniform_number: :asc)
  end
end
