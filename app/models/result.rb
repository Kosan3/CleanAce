class Result < ApplicationRecord

  def first_team_total_score
    ining_score(self.top_first) + ining_score(self.top_second) + ining_score(self.top_third) + ining_score(self.top_fourth) + ining_score(self.top_fifth) + ining_score(self.top_sixth) + ining_score(self.top_seventh)
  end

  def second_team_total_score
    ining_score(self.bottom_first) + ining_score(self.bottom_second) + ining_score(self.bottom_third) + ining_score(self.bottom_fourth) + ining_score(self.bottom_fifth) + ining_score(self.bottom_sixth) + ining_score(self.bottom_seventh)
  end

  def result_name
    if self.first_team.include?("クリーンエース")
      if first_team_total_score > second_team_total_score
        "WIN!!"
      elsif first_team_total_score < second_team_total_score
        "LOSE.."
      else
        "DROW"
      end
    elsif self.second_team.include?("クリーンエース")
      if second_team_total_score > first_team_total_score
        "WIN!!"
      elsif second_team_total_score < first_team_total_score
        "LOSE.."
      else
        "DROW"
      end
    end
  end
end
