class ResultsController < ApplicationController
  def index
    @results = Result.all.order(created_at: :desc)
  end

  def show
  end
end
