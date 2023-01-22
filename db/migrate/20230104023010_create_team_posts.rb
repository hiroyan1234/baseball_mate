class CreateTeamPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :team_posts do |t|

      t.string :content
      t.integer :type
      t.string :title
      t.string :prefecture
      t.string :city
      t.timestamps
    end
  end
end
