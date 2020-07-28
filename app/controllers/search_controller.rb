class SearchController < ApplicationController
  def search
    content = params[:search][:content]
    @q = Product.where('product_name LIKE ?', "%#{content}%").ransack(params[:q])
    @products = @q.result(distinct: true)
  end
end
