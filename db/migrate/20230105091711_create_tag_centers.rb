class CreateTagCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_centers do |t|
      t.references :team_post, foreign_key: true
      t.references :player_post, foreign_key: true
      t.references :tag, foreign_key: true


      t.timestamps
    end
    add_index :tag_centers, [:team_post_id, :tag_id], unique: true
    add_index :tag_centers, [:player_post_id, :tag_id], unique: true
  end
end
