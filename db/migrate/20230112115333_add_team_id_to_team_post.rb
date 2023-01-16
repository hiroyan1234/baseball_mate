class AddTeamIdToTeamPost < ActiveRecord::Migration[6.1]
  def change
    add_column :team_posts, :team_id, :integer
  end
end
