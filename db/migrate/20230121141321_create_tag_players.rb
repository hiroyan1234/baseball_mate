class CreateTagPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_players do |t|
      t.references :player_post, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    add_index :tag_players, [:player_post_id, :tag_id], unique: true
  end
end
