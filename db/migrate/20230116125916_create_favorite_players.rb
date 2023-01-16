class CreateFavoritePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_players do |t|
      t.integer :user_id
      t.integer :player_post_id

      t.timestamps
    end
  end
end
