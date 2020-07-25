class Admin::MembersController < ApplicationController
  def new
    @member = Member.new
    @members = Member.all.order(uniform_number: :asc)
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to new_admin_member_path
    else
      render 'admin/member/new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to new_admin_member_path
  end

  def destroy
  end

  private

  def member_params
    params.require(:member).permit(:name,:en_name,:position,:introduction,:uniform_number)
  end
end
