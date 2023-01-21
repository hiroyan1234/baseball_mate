class CreateTagTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_teams do |t|

      t.timestamps
    end
  end
end
