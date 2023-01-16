class CreateFavoriteTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_teams do |t|
      t.integer :user_id
      t.integer :team_post_id

      t.timestamps
    end
  end
end
