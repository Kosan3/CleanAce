class Admin::ResultsController < ApplicationController
  before_action :protect_admin

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    if @result.first_team.blank? && @result.second_team.present?
      @result.first_team = 'クリーンエース'
      @result.opponent_team = @result.second_team
    elsif @result.first_team.present? && @result.second_team.blank?
      @result.second_team = 'クリーンエース'
      @result.opponent_team = @result.first_team
    end
    @result.save
    redirect_to new_admin_result_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def result_params
    params.require(:result).permit(:opponent_team,:top_first,:bottom_first,:top_second,:bottom_second,:top_third,:bottom_third,:top_fourth,:bottom_fourth,
      :top_fifth,:bottom_fifth,:top_sixth,:bottom_sixth,:top_seventh,:bottom_seventh,:description,:first_team,:second_team)
  end
end
