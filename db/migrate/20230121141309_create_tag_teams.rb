class CreateTagTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_teams do |t|
      t.references :team_post, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    add_index :tag_teams, [:team_post_id, :tag_id], unique: true
  end
end
