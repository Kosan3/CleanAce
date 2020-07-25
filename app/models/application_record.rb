class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def ining_score(value)
    if value.nil? || value == "☓"
      value = 0
    else
      value.to_i
    end
  end
end
