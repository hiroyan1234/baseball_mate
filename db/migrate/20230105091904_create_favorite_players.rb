class CreateFavoritePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_players do |t|

      t.timestamps
    end
  end
end
