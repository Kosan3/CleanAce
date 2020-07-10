class Admin::TypesController < ApplicationController

  def index
    @types = Type.all
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    @type.save
    redirect_to admin_types_path
  end

  def edit
  end

  def update
  end


  private

  def type_params
    params.require(:type).permit(:type_name,:introduction,:image)
  end
end
