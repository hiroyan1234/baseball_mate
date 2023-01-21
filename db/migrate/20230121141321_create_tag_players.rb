class CreateTagPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_players do |t|

      t.timestamps
    end
  end
end
