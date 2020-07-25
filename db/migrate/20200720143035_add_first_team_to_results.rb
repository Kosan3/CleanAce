class AddFirstTeamToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :first_team, :string
    add_column :results, :second_team, :string
  end
end
