class CreatePlayerPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :player_posts do |t|
      
      t.string :content
      t.integer :type
      t.string :position
      t.string :title
      t.string :prefecture
      t.string :city
      t.timestamps
    end
  end
end
