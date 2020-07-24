class SearchController < ApplicationController
  def search
    content = params[:search][:content]
    @types = Type.where('type_name LIKE ?', "%#{content}%")
  end
end
